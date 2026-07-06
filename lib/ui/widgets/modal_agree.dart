import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/widgets/icon_button_custom.dart';
import 'package:flutter/material.dart';

class ModalAgree extends StatelessWidget {
  const ModalAgree(
      {super.key,
      required bool open,
      required GestureTapCallback onClose,
      required String title,
      required GestureTapCallback onAgree})
      : _open = open,
        _onAgree = onAgree,
        _title = title,
        _onClose = onClose;

  final bool _open;
  final String _title;
  final GestureTapCallback _onClose;
  final GestureTapCallback _onAgree;

  @override
  Widget build(BuildContext context) {
    if (_open) {
      return GestureDetector(
        onTap: _onClose,
        child: Container(
          decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.darken,
              color: const Color.fromARGB(73, 0, 0, 0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: GestureDetector(
              onTap: () => {},
              child: Container(
                width: 300,
                height: 180,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.white1,
                ),
                child: Column(
                  children: [
                    Text(
                      _title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: AppColors.customBlue,
                          fontSize: 16),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 24,
                        children: [
                          IconButtonCustom(
                            icon: Icons.cancel_outlined,
                            onClick: _onClose,
                            text: 'Нет',
                            color: AppColors.red1,
                            backgroundColor: AppColors.red2,
                            overlayColor:
                                const Color.fromARGB(255, 252, 153, 142),
                          ),
                          IconButtonCustom(
                            icon: Icons.delete_forever_outlined,
                            onClick: _onAgree,
                            text: 'Да',
                            color: AppColors.customBlue3,
                            backgroundColor: AppColors.customBlue5,
                            overlayColor:
                                const Color.fromARGB(255, 163, 180, 191),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
