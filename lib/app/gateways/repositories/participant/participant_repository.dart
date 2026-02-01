import 'package:tournament_app/app/models/participant/participant.dart';

abstract class ParticipantRepository {
  List<Participant> getAll();
  Participant create(Participant participant);
}