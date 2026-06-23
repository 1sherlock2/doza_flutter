import 'dart:math';

/// Генерирует уникальное число, которого нет в [existingNumbers].
///
/// Если [number] уже присутствует в [existingNumbers], функция будет
/// генерировать новые случайные числа до тех пор, пока не найдёт уникальное.
///
/// [min] - минимальное значение генерируемого числа (по умолчанию 0)
/// [max] - максимальное значение генерируемого числа (по умолчанию 100000)
int generateUniqueNumber({
  required int number,
  required List<int> existingNumbers,
  int min = 0,
  int max = 100000,
}) {
  final random = Random();
  int result = number;

  // Проверяем, есть ли число в списке
  while (existingNumbers.contains(result)) {
    // Генерируем новое случайное число
    result = min + random.nextInt(max - min + 1);
  }

  return result;
}

/// Альтернативная версия с использованием Set для оптимизации (O(1) проверка).
/// Работает быстрее на больших массивах.
int generateUniqueNumberOptimized({
  required int number,
  required List<int> existingNumbers,
  int min = 0,
  int max = 100000,
}) {
  final random = Random();
  final existingSet =
      existingNumbers.toSet(); // O(n) на создание, но O(1) на проверку
  int result = number;

  while (existingSet.contains(result)) {
    result = min + random.nextInt(max - min + 1);
  }

  return result;
}

/// Рекурсивная версия (менее предпочтительна, т.к. может вызвать StackOverflow
/// на большом количестве рекурсий, но возможна для демонстрации)
int generateUniqueNumberRecursive({
  required int number,
  required List<int> existingNumbers,
  int min = 0,
  int max = 100000,
}) {
  if (!existingNumbers.contains(number)) {
    return number;
  }

  final random = Random();
  final newNumber = min + random.nextInt(max - min + 1);
  return generateUniqueNumberRecursive(
    number: newNumber,
    existingNumbers: existingNumbers,
    min: min,
    max: max,
  );
}

/// Пример использования:
///
/// final numbers = [1, 2, 3, 4, 5];
/// final unique = generateUniqueNumber(number: 3, existingNumbers: numbers);
/// print(unique); // Напечатает число, которого нет в [1, 2, 3, 4, 5]
