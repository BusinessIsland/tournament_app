class ParticipantOutputDto {
  String gender;
  String fullname;
  DateTime dateOfBirth;
  String belt;
  String sportsTitle;
  double weight;
  String region;
  List<String> trainers;
  String block;
  int age;

  ParticipantOutputDto(this.gender, this.fullname, this.dateOfBirth, this.belt,
      this.sportsTitle, this.weight, this.region, this.trainers, this.block,
      this.age);
}