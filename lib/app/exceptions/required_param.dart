class RequiredParam {
  final String message;
  RequiredParam(this.message);

  @override
  String toString() {
    return "параметр обязателен для заполнения: $message";
  }
}