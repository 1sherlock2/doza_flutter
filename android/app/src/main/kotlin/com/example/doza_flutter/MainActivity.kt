package com.example.doza_flutter

import android.Manifest
import android.annotation.SuppressLint
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import android.provider.Settings
import android.telephony.SubscriptionInfo
import android.telephony.SubscriptionManager
import android.telephony.TelephonyManager
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
	override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
		super.configureFlutterEngine(flutterEngine)

		MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)
			.setMethodCallHandler { call, result ->
				when (call.method) {
					METHOD_GET_SIM_CARDS -> {
						runCatching { getSimCards() }
							.onSuccess(result::success)
							.onFailure { error ->
								result.error("sim_cards_error", error.message, null)
							}
					}

					METHOD_GET_DEVICE_ID -> {
						val androidId = Settings.Secure.getString(
							applicationContext.contentResolver,
							Settings.Secure.ANDROID_ID,
						)
						result.success(androidId)
					}

					else -> result.notImplemented()
				}
			}
	}

	@SuppressLint("MissingPermission", "HardwareIds")
	private fun getSimCards(): List<Map<String, Any?>> {
		// Use applicationContext for all telephony API calls — mirrors how the
		// mobile_number package works and avoids OEM-specific quirks where
		// Activity-context permission checks return DENIED even when the
		// permission is granted (observed on Samsung One UI, MIUI).
		val appContext = applicationContext

		if (!appContext.packageManager.hasSystemFeature(PackageManager.FEATURE_TELEPHONY)) {
			return emptyList()
		}

		val telephonyManager =
			appContext.getSystemService(Context.TELEPHONY_SERVICE) as? TelephonyManager
				?: return emptyList()

		// Android 5.1+ supports multiple SIM cards via SubscriptionManager.
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP_MR1) {
			val subscriptionManager =
				appContext.getSystemService(Context.TELEPHONY_SUBSCRIPTION_SERVICE) as? SubscriptionManager

			val subscriptions = collectAllSubscriptions(telephonyManager, subscriptionManager)
			// subscriptionManager is guaranteed non-null here because
			// collectAllSubscriptions returns emptyList() when it is null.
			if (subscriptions.isNotEmpty() && subscriptionManager != null) {
				return subscriptions.map { subscriptionInfo ->
					mapOf(
						"carrierName" to subscriptionInfo.carrierName.asNonBlankString(),
						"displayName" to subscriptionInfo.displayName.asNonBlankString(),
						"slotIndex" to subscriptionInfo.simSlotIndex,
						"number" to readPhoneNumber(appContext, subscriptionManager, telephonyManager, subscriptionInfo),
						"countryIso" to subscriptionInfo.countryIso.takeIf { !it.isNullOrBlank() },
						"countryPhonePrefix" to null,
					)
				}
			}
		}

		// Fallback: SubscriptionManager unavailable or returned no subscriptions.
		// Mirrors mobile_number's primary approach — read the default SIM directly
		// via TelephonyManager without a subscription ID.
		return buildFallbackFromDefaultTelephony(telephonyManager)
	}

	/**
	 * Collects all active SIM subscriptions using two independent sources and
	 * merges them by subscriptionId. This is necessary because on some OEM
	 * firmwares (Samsung One UI, MIUI) [SubscriptionManager.getActiveSubscriptionInfoList]
	 * silently returns only the primary SIM, while per-slot lookup via
	 * [SubscriptionManager.getActiveSubscriptionInfoForSimSlotIndex] still
	 * returns the second SIM correctly.
	 */
	@SuppressLint("MissingPermission")
	private fun collectAllSubscriptions(
		telephonyManager: TelephonyManager,
		subscriptionManager: SubscriptionManager?,
	): List<SubscriptionInfo> {
		if (subscriptionManager == null) return emptyList()

		// Source 1: bulk list
		val fromList = subscriptionManager.activeSubscriptionInfoList.orEmpty()

		// Source 2: per-slot scan — how many SIM slots does the device have?
		val slotCount = when {
			Build.VERSION.SDK_INT >= Build.VERSION_CODES.R ->
				telephonyManager.activeModemCount
			Build.VERSION.SDK_INT >= Build.VERSION_CODES.M ->
				@Suppress("DEPRECATION") telephonyManager.phoneCount
			else -> 2 // safe default for dual-SIM era devices
		}
		val fromSlots = (0 until slotCount).mapNotNull { slot ->
			subscriptionManager.getActiveSubscriptionInfoForSimSlotIndex(slot)
		}

		// Merge both sources, deduplicate by subscriptionId, sort by slot index
		return (fromList + fromSlots)
			.distinctBy { it.subscriptionId }
			.sortedBy { it.simSlotIndex }
	}

	@SuppressLint("MissingPermission", "HardwareIds")
	private fun buildFallbackFromDefaultTelephony(
		telephonyManager: TelephonyManager,
	): List<Map<String, Any?>> {
		val carrierName = telephonyManager.simOperatorName?.takeIf { it.isNotBlank() }
		val number = telephonyManager.line1Number?.takeIf { it.isNotBlank() }
		val countryIso = telephonyManager.simCountryIso?.takeIf { it.isNotBlank() }

		if (carrierName == null && number == null) return emptyList()

		return listOf(
			mapOf(
				"carrierName" to carrierName,
				"displayName" to carrierName,
				"slotIndex" to 0,
				"number" to number,
				"countryIso" to countryIso,
				"countryPhonePrefix" to null,
			)
		)
	}

	@SuppressLint("MissingPermission", "HardwareIds")
	@Suppress("DEPRECATION")
	private fun readPhoneNumber(
		appContext: Context,
		subscriptionManager: SubscriptionManager,
		telephonyManager: TelephonyManager,
		subscriptionInfo: SubscriptionInfo,
	): String? {
		val subscriptionId = subscriptionInfo.subscriptionId

		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU &&
			ContextCompat.checkSelfPermission(appContext, Manifest.permission.READ_PHONE_NUMBERS)
				== PackageManager.PERMISSION_GRANTED
		) {
			subscriptionManager.getPhoneNumber(subscriptionId).takeIf { it.isNotBlank() }?.let {
				return it
			}
		}

		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
			telephonyManager.createForSubscriptionId(subscriptionId).line1Number
				?.takeIf { it.isNotBlank() }
				?.let { return it }
		}

		return subscriptionInfo.number.takeIf { !it.isNullOrBlank() }
	}

	private fun CharSequence?.asNonBlankString(): String? {
		val value = this?.toString()?.trim()
		return value?.takeIf { it.isNotEmpty() }
	}

	private companion object {
		const val CHANNEL_NAME = "doza_flutter/device_id"
		const val METHOD_GET_SIM_CARDS = "getSimCards"
		const val METHOD_GET_DEVICE_ID = "getDeviceId"
	}
}
