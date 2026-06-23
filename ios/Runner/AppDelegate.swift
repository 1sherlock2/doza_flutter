import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    let channel = FlutterMethodChannel(
      name: "doza_flutter/device_id",
      binaryMessenger: engineBridge.dartExecutor
    )
    channel.setMethodCallHandler { call, result in
      switch call.method {
      case "getDeviceId":
        let deviceId = UIDevice.current.identifierForVendor?.uuidString ?? "unknown"
        result(deviceId)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }
}