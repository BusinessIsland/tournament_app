class InvalidWeight implements Exception{
  final String message;
  InvalidWeight(this.message);

  @override
  String toString() {
    return "неверно указан вес: $message";
  }
}