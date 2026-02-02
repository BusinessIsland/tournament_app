enum AgeCategory {
  u12("10-11 лет"),
  u14('12-13 лет'),
  u16("14-15 лет"),
  u18("16-17 лет"),
  adult("18 лет и старше");

  final String label;
  const AgeCategory(this.label);
}