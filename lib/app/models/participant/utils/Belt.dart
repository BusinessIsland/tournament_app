// перечисление видов поясов
enum Belt {
  ku,
  dan,
  undefined
}

// расширение для получения строкового описания значения Belt
extension BeltStringifier on Belt {
  String toStringBelt() {
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