import 'package:tournament_app/app/domain/parts/id/id.dart';
import 'package:tournament_app/app/domain/parts/name/person_name.dart';

class Trainer {
  final Id id;
  final PersonName name;

  const Trainer({required this.id, required this.name});

  @override
  String toString() {
    return 'Trainer{id: $id, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Trainer && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
