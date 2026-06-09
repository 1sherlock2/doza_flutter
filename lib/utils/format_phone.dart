String formatPhone(String phone) {
  final digits = phone.replaceAll(RegExp(r'[^\d]'), '');
  if (digits.length != 11) return phone;
  final code = digits.substring(1, 4);
  final part1 = digits.substring(4, 7);
  final part2 = digits.substring(7, 9);
  final part3 = digits.substring(9, 11);

  return '+7 ($code) $part1-$part2-$part3';
}
