class InvalidDataType implements Exception {
  final String message;
  InvalidDataType(this.message);

  @override
  String toString() {
    return "ошибка при обработке данных: $message";
  }
}