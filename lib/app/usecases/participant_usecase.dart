import 'package:tournament_app/app/dto/participant_output_dto.dart';
import 'package:tournament_app/app/gateways/repositories/participant/participant_repository.dart';

class ParticipantUsecase {
  ParticipantRepository repository;

  ParticipantUsecase(this.repository);

  List<ParticipantOutputDto> readAll() {
    print(repository.getAll());

    return List.empty();
  }
}