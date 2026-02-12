import 'package:tournament_app/app/dto/participant/participant_create_dto.dart';
import 'package:tournament_app/app/dto/participant/participant_get_all_filter.dart';
import 'package:tournament_app/app/dto/participant/participant_output_dto.dart';
import 'package:tournament_app/app/dto/participant/participant_update_dto.dart';
import 'package:tournament_app/app/gateways/repositories/participant/participant_repository.dart';

class ParticipantUseCase {
  ParticipantRepository repository;

  ParticipantUseCase({required this.repository});

  List<ParticipantOutputDto> getAll(ParticipantGetAllFilter filter) {
    final participants = repository.getAll(filter);

    final result = List<ParticipantOutputDto>.empty(growable: true);

    for (final participant in participants) {
      result.add(ParticipantOutputDto.fromModel(participant));
    }

    return result;
  }

  ParticipantOutputDto? getById(String id) {
    final participant = repository.getById(id);

    if (participant == null) return null;
    return ParticipantOutputDto.fromModel(participant);
  }

  ParticipantOutputDto create(ParticipantCreateDto dto) {
    final participant = repository.create(dto);
    return ParticipantOutputDto.fromModel(participant);
  }

  ParticipantOutputDto update(ParticipantUpdateDto dto, String id) {
    final participant = repository.update(dto, id);
    return ParticipantOutputDto.fromModel(participant);
  }

  void delete(String id) {
    repository.delete(id);
  }
}
