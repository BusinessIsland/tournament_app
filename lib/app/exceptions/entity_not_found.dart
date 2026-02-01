class EntityNotFound implements Exception {
  final String message;
  EntityNotFound(this.message);

  @override
  String toString() {
    return "запись не найдена: $message";
  }
}