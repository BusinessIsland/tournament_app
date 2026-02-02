class ParticipantGetAllFilter {
  String? region;
  String? trainerName;

  ParticipantGetAllFilter(this.region, this.trainerName);

  bool get hasParams {
    return region != null || trainerName != null;
  }
}