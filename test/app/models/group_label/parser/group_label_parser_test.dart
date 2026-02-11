import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/models/parts/group_label/group_label.dart';
import 'package:tournament_app/app/models/parts/group_label/parser/builders/group_label_parser_builder_impl.dart';

void main() {
  GroupLabel parseGroupLabel(String input) {
    final builder = GroupLabelParserBuilderImpl();

    builder.addStandardParser();

    final parser = builder.build();
    return parser.parse(input);
  }

  group("GroupLabelParser_Success", () {
    final label = "юноши 14-15 лет";

    test("parser should create GroupLabel from string", () {
      final parsed = parseGroupLabel(label);

      expect(parsed.label, label);
    });
  });
}
