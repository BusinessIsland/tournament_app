import 'package:tournament_app/app/models/parts/id/id.dart';
import 'package:tournament_app/app/models/parts/name/person_name.dart';

class Trainer {
  final Id id;
  final PersonName name;

  const Trainer({required this.id, required this.name});

  @override
  String toString() => name.formatted;
}
