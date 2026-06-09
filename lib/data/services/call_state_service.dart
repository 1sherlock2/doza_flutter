import 'dart:async';

import 'package:call_state_handler/call_state_handler.dart';
import 'package:logging/logging.dart';

enum CallEventType { started, completed, failed }

class CallStateService {
  final CallStateHandler _callDetector = CallStateHandler();
  final _callStateController = StreamController<CallEventType>.broadcast();
  final Logger _log = Logger('CallStateService');

  bool _callStarted = false;
  bool _isCallDetected = false;

  Stream<CallEventType> get callStateStream => _callStateController.stream;
  bool get isCallDetected => _isCallDetected;

  Future<void> initialize() async {
    await _callDetector.initialize();
    _callDetector.onCallStateChanged.listen((callState) {
      if (callState.isCallActive && !_callStarted) {
        _callStarted = true;
        _log.info('📞 Call started');
        _callStateController.add(CallEventType.started);
      } else if (!callState.isCallActive && _callStarted) {
        _isCallDetected = true;
        _callStarted = false;
        _log.info('✅ Call completed');
        _callStateController.add(CallEventType.completed);
      }
    });
  }

  void reset() {
    _callStarted = false;
    _isCallDetected = false;
  }

  void dispose() {
    _callStateController.close();
    _callDetector.dispose();
  }
}
