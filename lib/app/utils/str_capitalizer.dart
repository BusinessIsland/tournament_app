class StrCapitalizer {
  static String capitalize(String s) {
    return s.isEmpty ? "" : s[0].toUpperCase() + s.substring(1).toLowerCase();
  }
}