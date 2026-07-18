import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class OrderExpiresTimer extends StatefulWidget {
  const OrderExpiresTimer({
    super.key,
    required this.expiresAt,
    this.onExpired,
  });

  final DateTime expiresAt;
  final VoidCallback? onExpired;

  @override
  State<OrderExpiresTimer> createState() => _OrderExpiresTimerState();
}

class _OrderExpiresTimerState extends State<OrderExpiresTimer> {
  Timer? _timer;
  Duration _remaining = Duration.zero;
  bool _isExpired = false;

  @override
  void initState() {
    super.initState();
    _updateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateRemaining();
    });
  }

  void _updateRemaining() {
    final remaining = widget.expiresAt.difference(DateTime.now());
    if (remaining.isNegative) {
      _timer?.cancel();
      if (!_isExpired) {
        setState(() {
          _isExpired = true;
          _remaining = Duration.zero;
        });
        SchedulerBinding.instance.addPostFrameCallback((_) {
          widget.onExpired?.call();
        });
      }
      return;
    }
    setState(() {
      _remaining = remaining;
    });
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isExpired) {
      return Text(
        'Время оплаты истекло',
        style: TextStyle(
          color: Colors.red.shade400,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      );
    }

    return Row(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.timer_outlined, size: 14, color: Colors.orange.shade700),
        Text(
          _formatDuration(_remaining),
          style: TextStyle(
            color: Colors.orange.shade700,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}
