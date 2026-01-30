import 'package:tournament_app/app/dto/participant_output_dto.dart';
import 'package:tournament_app/app/gateways/repositories/participant/participant_repository.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

class ParticipantUsecase {
  ParticipantRepository repository;

  ParticipantUsecase(this.repository);

  List<ParticipantOutputDto> readAll() {
    final data = repository.getAll();

    final participants = List<Participant>.empty(growable: true);

    for (final dto in data) {
      participants.add(Participant.fromDto(dto));
    }

    final response = List<ParticipantOutputDto>.empty(growable: true);

    for (final p in participants) {
      response.add(ParticipantOutputDto.fromParticipantModel(p));
    }

    return response;
  }
}