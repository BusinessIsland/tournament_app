// перечисление видов поясов
enum Belt {
  ku,
  dan
}

// расширение для получения строкового описания значения Belt
extension BeltStringifier on Belt {
  String toStringBelt() {
    switch (name) {
      case "ku":
        return "кю";
      case "dan":
        return "дан";
      default:
        return "";
    }
  }
}