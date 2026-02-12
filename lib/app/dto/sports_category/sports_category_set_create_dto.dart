class SportsCategorySetCreateDto {
  String groupLabel;
  String gender;
  String minAge;
  String maxAge;
  List<(String? minWeight, String? maxWeight)> weights;

  SportsCategorySetCreateDto({
    required this.groupLabel,
    required this.gender,
    required this.minAge,
    required this.maxAge,
    required this.weights,
  });
}
