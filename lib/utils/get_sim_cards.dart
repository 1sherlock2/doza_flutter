import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:result_dart/result_dart.dart';

const _simCardsChannel = MethodChannel('tracking_client/sim_cards');

AsyncResultDart<List<SimCard>, String> getSimCards() async {
  try {
    var status = await Permission.phone.status;
    if (!status.isGranted) {
      status = await Permission.phone.request();
    }
    if (!status.isGranted) {
      // TODO: сделать функционал повторного запроса разрешения
      return Failure('Not permission on get phone info');
    }

    final simCards = await _loadSimCards();
    if (simCards == null || simCards.isEmpty) {
      return Failure('Sim cards is not defined');
    }
    return Success(simCards);
  } on PlatformException catch (error) {
    return Failure(error.message ?? error.code);
  } catch (error) {
    return Failure(error.toString());
  }
}

Future<List<SimCard>?> _loadSimCards() async {
  if (defaultTargetPlatform == TargetPlatform.android) {
    final simCards = await _loadAndroidSimCards();
    if (simCards != null && simCards.isNotEmpty) {
      return simCards;
    }
  }

  return MobileNumber.getSimCards;
}

Future<List<SimCard>?> _loadAndroidSimCards() async {
  try {
    final rawSimCards = await _simCardsChannel.invokeListMethod<dynamic>(
      'getSimCards',
    );
    if (rawSimCards == null) {
      return null;
    }

    return rawSimCards
        .map((rawSimCard) {
          return SimCard.fromMap(
            Map<String, dynamic>.from(rawSimCard as Map<dynamic, dynamic>),
          );
        })
        .toList(growable: false);
  } on MissingPluginException {
    return null;
  } on PlatformException {
    return null;
  }
}
