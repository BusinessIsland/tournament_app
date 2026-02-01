// перечисление видов поясов
enum BeltType {
  ku("кю"),
  dan("дан"),
  undefined("-");

  final String label;
  const BeltType(this.label);

  @override
  String toString() => label;
}
