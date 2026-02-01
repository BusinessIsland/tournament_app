class ParticipantGetAllFilter {
  String? region;
  String? trainerName;

  ParticipantGetAllFilter(this.region, this.trainerName);

  factory ParticipantGetAllFilter.empty() {
    return ParticipantGetAllFilter(null, null);
  }

  factory ParticipantGetAllFilter.withRegion(String region) {
    return ParticipantGetAllFilter(region, null);
  }

  factory ParticipantGetAllFilter.withTrainerName(String trainerName) {
    return ParticipantGetAllFilter(null, trainerName);
  }

  factory ParticipantGetAllFilter.withRegionAndTrainerName(String region, String trainerName) {
    return ParticipantGetAllFilter(region, trainerName);
  }
}