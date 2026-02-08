import 'package:tournament_app/app/dto/participant_create_dto.dart';
import 'package:tournament_app/app/dto/participant_get_all_filter.dart';
import 'package:tournament_app/app/dto/participant_update_dto.dart';
import 'package:tournament_app/app/models/participant/participant.dart';
import 'package:tournament_app/app/models/participant/participant_list.dart';

abstract class IParticipantRepository {
  ParticipantList getAll(ParticipantGetAllFilter filter);
  Participant? getById(String id);
  Participant create(ParticipantCreateDto dto);
  Participant update(ParticipantUpdateDto dto, String id);
  void delete(String id);
}