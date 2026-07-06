import 'package:flutter/material.dart';

class BoxShadowCustom {
  static List<BoxShadow> get shadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 4,
          offset: const Offset(0, 2),
        )
      ];
}
