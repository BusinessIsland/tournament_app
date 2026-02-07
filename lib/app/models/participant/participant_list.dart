import 'package:tournament_app/app/models/participant/participant.dart';
import 'package:tournament_app/app/models/parts/id/id.dart';

abstract class ParticipantList {
  void add(Participant participant);
  Participant? findById(Id id);
  void delete(Id id);
  int get size;
}

class ParticipantListBasicImpl extends ParticipantList {
  final List<Participant> _list = List<Participant>.empty(growable: true);

  @override
  void add(Participant participant) => _list.add(participant);

  @override
  Participant? findById(Id id) {
    try {
      return _list.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  void delete(Id id) => _list.removeWhere((p) => p.id == id);

  @override
  int get size => _list.length;
}