import 'package:tournament_app/app/models/participant/participant.dart';

abstract class ParticipantList extends Iterable<Participant> {
  Participant? findById(String id);

  void add(Participant participant);

  void replace(Participant participant, String id);

  void delete(String id);

  int get size;
}

class ParticipantListBasicImpl extends ParticipantList {
  final List<Participant> _list = List<Participant>.empty(growable: true);

  @override
  Participant? findById(String id) {
    try {
      return _list.firstWhere((p) => p.id.toString() == id);
    } catch (_) {
      return null;
    }
  }

  @override
  void add(Participant participant) => _list.add(participant);

  @override
  void replace(Participant participant, String id) {
    final index = _list.indexWhere((p) => p.id.toString() == id);
    if (index != -1) {
      _list[index] = participant;
    }
  }

  @override
  void delete(String id) => _list.removeWhere((p) => p.id.toString() == id);

  @override
  int get size => _list.length;

  @override
  Iterator<Participant> get iterator => _list.iterator;
}
