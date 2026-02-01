import 'package:tournament_app/app/dto/participant_create_dto.dart';
import 'package:tournament_app/app/dto/participant_get_all_filter.dart';
import 'package:tournament_app/app/dto/participant_update_dto.dart';
import 'package:tournament_app/app/gateways/repositories/participant/participant_repository.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

class ParticipantUseCase {
  ParticipantRepository repository;

  ParticipantUseCase(this.repository);

  List<Participant> readAll(ParticipantGetAllFilter filter) {
    return repository.getAll(filter);
  }

  Participant create(ParticipantCreateDto dto) {
    return repository.create(dto);
  }

  Participant update(String id, ParticipantUpdateDto dto) {
    return repository.update(id, dto);
  }

  void delete(List<String> ids) {
    repository.delete(ids);
  }
}