class InvalidAge implements Exception{
  final String message;
  InvalidAge(this.message);

  @override
  String toString() {
    return "неверно указана дата рождения: $message";
  }
}