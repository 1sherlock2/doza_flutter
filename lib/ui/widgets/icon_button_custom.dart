import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  const IconButtonCustom({
    super.key,
    required GestureTapCallback onClick,
    required String? text,
    required Color color,
    IconData? icon,
    Color? overlayColor,
    Color? backgroundColor = Colors.transparent,
  })  : _onClick = onClick,
        _text = text,
        _icon = icon,
        _overlayColor = overlayColor,
        _backgroundColor = backgroundColor,
        _color = color;

  final Color? _overlayColor;
  final GestureTapCallback _onClick;
  final String? _text;
  final Color _color;
  final IconData? _icon;
  final Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          overlayColor: WidgetStateProperty<Color>.fromMap(
              {WidgetState.pressed: _overlayColor ?? Colors.transparent}),
          onTap: _onClick,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                if (_icon != null)
                  Icon(
                    _icon,
                    color: _color,
                  ),
                if (_text != null)
                  Text(
                    _text!,
                    style: TextStyle(color: _color),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
