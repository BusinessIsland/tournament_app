class SheetNotFoundException implements Exception {
  final String sheetName;
  SheetNotFoundException(this.sheetName);

  @override
  String toString() {
    return "в указанном файле нет листа '$sheetName'";
  }
}