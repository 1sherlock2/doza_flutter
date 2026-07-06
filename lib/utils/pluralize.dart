/// Склоняет существительное в зависимости от числа.
///
/// Примеры:
/// ```dart
/// pluralize(1, ['товар', 'товара', 'товаров']); // "1 товар"
/// pluralize(2, ['товар', 'товара', 'товаров']); // "2 товара"
/// pluralize(5, ['товар', 'товара', 'товаров']); // "5 товаров"
/// ```
///
/// [count] — количество.
/// [forms] — массив из трёх форм слова: [для 1, для 2-4, для 5+].
///
/// Возвращает строку вида: "число слово".
library;

String pluralize(int count, List<String> forms) {
  final num = count.abs() % 100;
  final num1 = num % 10;

  if (num > 10 && num < 20) return '$count ${forms[2]}';
  if (num1 > 1 && num1 < 5) return '$count ${forms[1]}';
  if (num1 == 1) return '$count ${forms[0]}';
  return '$count ${forms[2]}';
}
