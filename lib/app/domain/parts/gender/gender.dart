import 'package:tournament_app/app/domain/parts/gender/gender_type.dart';

class Gender {
  final GenderType type;

  const Gender({required this.type});

  String get label => type.label;

  String get shortLabel => type.shortLabel;

  bool get isMale => type == GenderType.male;
  bool get isFemale => type == GenderType.female;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Gender && runtimeType == other.runtimeType && type == other.type;

  @override
  int get hashCode => type.hashCode;

  @override
  String toString() {
    return 'Gender{type: $type}';
  }

  static const male = Gender(type: GenderType.male);
  static const female = Gender(type: GenderType.female);
}
