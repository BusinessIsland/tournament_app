// перечисление блоков
enum Block {
  a,
  b,
  c,
  d,
  e,
  f,
  g,
  h;

  @override
  String toString() {
    switch (name) {
      case "a":
        return "А";
      case "b":
        return "Б";
      case "c":
        return "С";
      case "d":
        return "Д";
      case "e":
        return "Е";
      case "f":
        return "Ф";
      case "g":
        return "Ж";
      case "h":
        return "Х";
      default:
        return "";
    }
  }
}
