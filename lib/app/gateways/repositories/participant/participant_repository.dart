import 'package:tournament_app/app/dto/participant_input_dto.dart';

abstract class ParticipantRepository {
  List<ParticipantInputDto> getAll();
  ParticipantInputDto save(ParticipantInputDto dto);
}