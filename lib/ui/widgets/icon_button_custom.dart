import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  const IconButtonCustom({
    super.key,
    required GestureTapCallback onClick,
    required String text,
    required Color color,
    Color? overlayColor,
    Color? backgroundColor = Colors.transparent,
  })  : _onClick = onClick,
        _text = text,
        _overlayColor = overlayColor,
        _backgroundColor = backgroundColor,
        _color = color;

  final Color? _overlayColor;
  final GestureTapCallback _onClick;
  final String _text;
  final Color _color;
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
              spacing: 10,
              children: [
                Icon(
                  Icons.cancel_outlined,
                  color: _color,
                ),
                Text(
                  _text,
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
