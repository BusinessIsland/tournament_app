import 'package:tournament_app/app/dto/participant_output_dto.dart';
import 'package:tournament_app/app/gateways/repositories/participant/participant_repository.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

class ParticipantUseCase {
  ParticipantRepository repository;

  ParticipantUseCase(this.repository);

  List<Participant> readAll() {
    return repository.getAll();
  }

  Participant save(Participant participant) {
    return repository.create(participant);
  }
}