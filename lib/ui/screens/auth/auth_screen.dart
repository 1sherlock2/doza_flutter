import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/auth/view_models/auth_view_models.dart';
import 'package:doza_flutter/ui/screens/auth/widgets/auth_status_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.authViewModel});

  final AuthViewModel authViewModel;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  String? _getPhoneError() {
    final phone = _phoneController.text.replaceAll(RegExp(r'\D'), '');
    if (phone.isEmpty) return null;
    if (phone.length < 10) return 'Номер должен содержать 11 цифр';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: AppColors.customBlue,
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Transform.scale(
              scaleY: 0.8,
              alignment: Alignment.topCenter,
              child: Image.asset('assets/main_logo_2.jpg', fit: BoxFit.fill),
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Spacer(flex: 4),
                    // Анимированный контейнер
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      transform: Matrix4.translationValues(
                        0,
                        -keyboardHeight *
                            0.5, // поднимаем на половину высоты клавиатуры
                        0,
                      ),
                      width: 350,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.white2,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Вход в приложение',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsetsGeometry.only(top: 20),
                            child: TextField(
                              cursorColor: AppColors.black1,
                              controller: _phoneController,
                              focusNode: _focusNode,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                                // _PhoneInputFormatter(),
                              ],
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.customBlue,
                                    width: 0.5,
                                  ),
                                ),
                                hintText: ' (___) ___-__-__',
                                prefixText: '+7',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: const Color.fromARGB(61, 64, 83, 98),
                                    width: 0.1,
                                  ),
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.fromLTRB(14, 10, 10, 10),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.phone_rounded,
                                      color: AppColors.customBlue,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                errorText: _getPhoneError(),
                                counterText: '',
                                suffixIcon: ListenableBuilder(
                                  listenable: _phoneController,
                                  builder: (context, _) {
                                    if (_phoneController.text.isEmpty) {
                                      return SizedBox.shrink();
                                    }
                                    return IconButton(
                                      onPressed: () {
                                        _phoneController.clear();
                                        widget.authViewModel.setUserPhone('');
                                      },
                                      icon: Icon(
                                        Icons.cancel_rounded,
                                        color: AppColors.grey4,
                                        size: 20,
                                      ),
                                      splashRadius: 20,
                                    );
                                  },
                                ),
                              ),
                              onChanged: (value) =>
                                  widget.authViewModel.setUserPhone('7$value'),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 16),
                            child: FilledButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  AppColors.customBlue,
                                ),
                              ),
                              onPressed: () =>
                                  widget.authViewModel.handleClickCall(),
                              child: Text('Подтвердить номер'),
                            ),
                          ),
                          AuthStatusMessages(
                            authViewModel: widget.authViewModel,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _PhoneInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

//     if (digitsOnly.isEmpty) {
//       return newValue.copyWith(text: '');
//     }

//     // Убеждаемся, что номер начинается с 7
//     if (!digitsOnly.startsWith('7')) {
//       digitsOnly = '7$digitsOnly';
//     }

//     // Берем первые 11 цифр
//     if (digitsOnly.length > 11) {
//       digitsOnly = digitsOnly.substring(0, 11);
//     }

//     // Форматируем: +7 (ABC) DEF-GH-IJ
//     String formatted = '+7';

//     if (digitsOnly.length > 1) {
//       formatted += ' (';
//       formatted += digitsOnly.substring(
//         1,
//         digitsOnly.length > 3 ? 4 : digitsOnly.length,
//       );
//       if (digitsOnly.length > 3) {
//         formatted += ') ';
//         formatted += digitsOnly.substring(
//           4,
//           digitsOnly.length > 6 ? 7 : digitsOnly.length,
//         );
//         if (digitsOnly.length > 6) {
//           formatted += '-';
//           formatted += digitsOnly.substring(
//             7,
//             digitsOnly.length > 8 ? 9 : digitsOnly.length,
//           );
//           if (digitsOnly.length > 8) {
//             formatted += '-';
//             formatted += digitsOnly.substring(9);
//           }
//         }
//       }
//     }

//     return newValue.copyWith(
//       text: formatted,
//       selection: TextSelection.fromPosition(
//         TextPosition(offset: formatted.length),
//       ),
//     );
//   }
// }

// class _PhoneInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     // 1. Извлекаем только цифры
//     final newDigits = newValue.text.replaceAll(RegExp(r'\D'), '');
//     final oldDigits = oldValue.text.replaceAll(RegExp(r'\D'), '');

//     // 2. Определяем логическую позицию курсора в цифрах
//     int cursorDigitIndex = _getCursorDigitIndex(
//       oldValue.text,
//       oldValue.selection.baseOffset,
//     );

//     // Если пользователь удалил нецифровой символ (например, дефис),
//     // нужно также удалить одну цифру слева от курсора
//     if (newValue.text.length < oldValue.text.length &&
//         newDigits.length == oldDigits.length) {
//       // Была удалена маска, удаляем цифру перед позицией
//       if (cursorDigitIndex > 0) {
//         final updatedDigits =
//             oldDigits.substring(0, cursorDigitIndex - 1) +
//             oldDigits.substring(cursorDigitIndex);
//         // Переформатируем с уменьшенным количеством цифр
//         return _format(updatedDigits, cursorDigitIndex - 1);
//       }
//     }

//     // 3. Форматируем цифры
//     return _format(newDigits, cursorDigitIndex);
//   }

//   /// Возвращает индекс цифры, соответствующий позиции курсора в строке с маской
//   int _getCursorDigitIndex(String text, int cursorPos) {
//     int digitIndex = 0;
//     for (int i = 0; i < cursorPos && i < text.length; i++) {
//       if (RegExp(r'\d').hasMatch(text[i])) {
//         digitIndex++;
//       }
//     }
//     return digitIndex;
//   }

//   /// Форматирует цифры и устанавливает курсор на позицию, соответствующую logicalIndex
//   TextEditingValue _format(String digits, int logicalIndex) {
//     if (digits.isEmpty) {
//       return TextEditingValue(
//         text: '',
//         selection: TextSelection.collapsed(offset: 0),
//       );
//     }

//     // Гарантируем начало с '7'
//     if (!digits.startsWith('7')) {
//       digits = '7$digits';
//     }
//     if (digits.length > 11) {
//       digits = digits.substring(0, 11);
//     }

//     final buffer = StringBuffer('+7');
//     if (digits.length > 1) {
//       buffer.write(' (');
//       buffer.write(digits.substring(1, digits.length > 3 ? 4 : digits.length));
//       if (digits.length > 3) {
//         buffer.write(') ');
//         buffer.write(
//           digits.substring(4, digits.length > 6 ? 7 : digits.length),
//         );
//         if (digits.length > 6) {
//           buffer.write('-');
//           buffer.write(
//             digits.substring(7, digits.length > 8 ? 9 : digits.length),
//           );
//           if (digits.length > 8) {
//             buffer.write('-');
//             buffer.write(digits.substring(9));
//           }
//         }
//       }
//     }

//     final formatted = buffer.toString();

//     // Находим физическую позицию курсора, соответствующую logicalIndex
//     int physicalPos = 0;
//     int digitCount = 0;
//     for (int i = 0; i < formatted.length; i++) {
//       if (RegExp(r'\d').hasMatch(formatted[i])) {
//         if (digitCount == logicalIndex) {
//           physicalPos = i;
//           break;
//         }
//         digitCount++;
//       }
//       physicalPos =
//           i + 1; // если logicalIndex выходит за количество цифр, ставим в конец
//     }

//     return TextEditingValue(
//       text: formatted,
//       selection: TextSelection.collapsed(offset: physicalPos),
//     );
//   }
// }
