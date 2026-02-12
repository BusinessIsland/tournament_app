import 'package:tournament_app/app/dto/competition_judge/competition_judge_create_dto.dart';
import 'package:tournament_app/app/dto/competition_judge/competition_judge_output_dto.dart';
import 'package:tournament_app/app/dto/competition_judge/competition_judge_update_dto.dart';
import 'package:tournament_app/app/gateways/repositories/competition_judge/competition_judge_repository.dart';

class CompetitionJudgeUseCase {
  CompetitionJudgeRepository repository;

  CompetitionJudgeUseCase({required this.repository});

  List<CompetitionJudgeOutputDto> getAll() {
    final participants = repository.getAll();

    final result = List<CompetitionJudgeOutputDto>.empty(growable: true);

    for (final participant in participants) {
      result.add(CompetitionJudgeOutputDto.fromModel(participant));
    }

    return result;
  }

  CompetitionJudgeOutputDto? getById(String id) {
    final participant = repository.getById(id);

    if (participant == null) return null;
    return CompetitionJudgeOutputDto.fromModel(participant);
  }

  CompetitionJudgeOutputDto create(CompetitionJudgeCreateDto dto) {
    final participant = repository.create(dto);
    return CompetitionJudgeOutputDto.fromModel(participant);
  }

  CompetitionJudgeOutputDto update(CompetitionJudgeUpdateDto dto, String id) {
    final participant = repository.update(dto, id);
    return CompetitionJudgeOutputDto.fromModel(participant);
  }

  void delete(String id) {
    repository.delete(id);
  }
}