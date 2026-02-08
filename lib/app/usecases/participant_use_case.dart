import 'package:tournament_app/app/dto/participant_create_dto.dart';
import 'package:tournament_app/app/dto/participant_get_all_filter.dart';
import 'package:tournament_app/app/dto/participant_update_dto.dart';
import 'package:tournament_app/app/gateways/repositories/participant/i_participant_repository.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

class ParticipantUseCase {
  IParticipantRepository repository;

  ParticipantUseCase(this.repository);

  List<Participant> readAll(ParticipantGetAllFilter filter) {
    return repository.getAll(filter);
  }

  Participant create(ParticipantCreateDto dto) {
    return repository.create(dto);
  }

  Participant update(ParticipantUpdateDto dto) {
    return repository.update(dto);
  }

  void delete(List<String> ids) {
    repository.delete(ids);
  }
}