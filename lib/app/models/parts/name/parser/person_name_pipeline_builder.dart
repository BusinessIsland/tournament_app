import 'package:tournament_app/app/models/parts/name/parser/person_name_parser_registry.dart';
import 'package:tournament_app/app/models/parts/name/parser/person_name_pattern_parser.dart';
import 'package:tournament_app/app/models/parts/name/parser/person_name_pipeline.dart';

class PersonNamePipelineBuilder {
  final List<PersonNamePatternParser> _parsers = [];

  void _add(PersonNamePatternParser parser) {
    _parsers.add(parser);
  }

  PersonNamePipelineBuilder addFullName() {
    _add(PersonNameParserRegistry.fullName());
    return this;
  }

  PersonNamePipelineBuilder addInitials() {
    _add(PersonNameParserRegistry.initials());
    return this;
  }

  PersonNamePipelineBuilder addShortName() {
    _add(PersonNameParserRegistry.shortName());
    return this;
  }

  PersonNamePipeline build() {
    if (_parsers.isEmpty) {
      throw Exception("пайплайн пустой");
    }

    return PersonNamePipeline(List.unmodifiable(_parsers));
  }
}
