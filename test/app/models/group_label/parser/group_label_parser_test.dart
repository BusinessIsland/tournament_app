import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/group_label/parser/group_label_parser.dart';

void main() {
  late GroupLabelParser parser;

  setUp(() {
    parser = GroupLabelParser();
  });

  group("GroupLabelParser_Success", () {
    final label = "юноши 14-15 лет";

    test("parser should create GroupLabel from string", () {
      final parsed = parser.parse(label);

      expect(parsed.label, label);
    });
  });
}
