// перечисление видов поясов
enum BeltType {
  ku,
  dan,
  undefined;

  @override
  String toString() {
    switch (name) {
      case "ku":
        return "кю";
      case "dan":
        return "дан";
      case "undefined":
        return "не указано";
      default:
        return "";
    }
  }
}