import 'package:collection/collection.dart';
import 'package:tournament_app/app/domain/participant/container/participant_list.dart';
import 'package:tournament_app/app/domain/participant/participant.dart';
import 'package:tournament_app/app/domain/parts/id/id.dart';

class ParticipantListBasicImpl extends ParticipantList {
  final List<Participant> _list;

  ParticipantListBasicImpl(this._list);

  factory ParticipantListBasicImpl.fromIterable(Iterable<Participant> list) {
    return ParticipantListBasicImpl(List.of(list));
  }

  @override
  Participant? findById(Id id) {
    return _list.firstWhereOrNull((p) => p.id == id);
  }

  @override
  void add(Participant participant) {
    if (_list.any((p) => p.id == participant.id)) {
      throw ArgumentError("участник с id ${participant.id} уже существует");
    }
    _list.add(participant);
  }

  @override
  bool replace(Participant participant, Id id) {
    final index = _list.indexWhere((p) => p.id == id);
    if (index != -1) {
      _list[index] = participant;
      return true;
    }

    return false;
  }

  @override
  void delete(Id id) => _list.removeWhere((p) => p.id == id);

  @override
  int get size => _list.length;

  @override
  Iterator<Participant> get iterator => _list.iterator;

  @override
  Iterable<Participant> get container => List.unmodifiable(_list);
}