import 'package:tournament_app/app/dto/participant_create_dto.dart';
import 'package:tournament_app/app/dto/participant_get_all_filter.dart';
import 'package:tournament_app/app/dto/participant_update_dto.dart';
import 'package:tournament_app/app/models/participant/participant.dart';

abstract class ParticipantRepository {
  List<Participant> getAll(ParticipantGetAllFilter filter);
  Participant getById(String id);
  Participant create(ParticipantCreateDto dto);
  Participant update(String id, ParticipantUpdateDto dto);
  void delete(List<String> id);
}