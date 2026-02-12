import 'package:tournament_app/app/domain/participant/participant.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';

abstract class ParticipantList extends Iterable<Participant> {
  Participant? findById(Id id);

  void add(Participant participant);

  bool replace(Participant participant, Id id);

  void delete(Id id);

  int get size;

  Iterable<Participant> get container;
}
