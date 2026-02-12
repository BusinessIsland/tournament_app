import 'package:tournament_app/app/domain/parts/belt/belt.dart';
import 'package:tournament_app/app/domain/parts/belt/parser/belt_pattern_parser.dart';
import 'package:tournament_app/app/domain/parts/belt/parser/patterns/dan_belt_pattern.dart';
import 'package:tournament_app/app/domain/parts/belt/parser/patterns/ku_belt_pattern.dart';

class BeltParserRegistry {
  static BeltPatternParser kuBelt = BeltPatternParser([
    (
      KuBeltPattern.kuBelt,
      (m) => KuBelt(rank: int.parse(m.namedGroup("rank")!, radix: 10)),
    ),
  ]);

  static BeltPatternParser danBelt = BeltPatternParser([
    (
      DanBeltPattern.danBelt,
      (m) => DanBelt(rank: int.parse(m.namedGroup("rank")!, radix: 10)),
    ),
  ]);
}
