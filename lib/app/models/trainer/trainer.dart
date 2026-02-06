import 'package:tournament_app/app/models/name/person_name.dart';
import 'package:tournament_app/app/models/name/person_name_parser.dart';

// сущность тренера
class Trainer {
  PersonName name;

  Trainer({required this.name});

  factory Trainer.parseSingle(String? raw) {
    final parser = FullNameParser()
        .setNext(NameWithInitialsParser())
        .setNext(ShortNameParser());

    final name = parser.parse(raw);
    return Trainer(name: name);
  }

  static List<Trainer> parseList(String? raw) {
    if (raw == null) {
      return [Trainer(name: UndefinedName())];
    }

    final rawNames = raw
        .split(RegExp(r'[;,/|\n]'))
        .where((s) => s.trim().isNotEmpty);

    return rawNames.map((name) => Trainer.parseSingle(name)).toList();
  }

  @override
  String toString() => name.formatted;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Trainer &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}

extension TrainersStringifier on List<Trainer> {
  String stringify() => map((trainer) => trainer.name.formatted).join(", ");
}
