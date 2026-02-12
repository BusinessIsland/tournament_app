import 'package:tournament_app/app/domain/parts/gender/parser/gender_parser_registry.dart';
import 'package:tournament_app/app/domain/parts/gender/parser/gender_pattern_parser.dart';
import 'package:tournament_app/app/domain/parts/gender/parser/gender_pipeline.dart';

class GenderPipelineBuilder {
  final List<GenderPatternParser> _parsers = [];

  void _add(GenderPatternParser parser) {
    _parsers.add(parser);
  }

  GenderPipelineBuilder addMale() {
    _add(GenderParserRegistry.male);
    return this;
  }

  GenderPipelineBuilder addFemale() {
    _add(GenderParserRegistry.female);
    return this;
  }

  GenderPipeline build() {
    if (_parsers.isEmpty) {
      throw Exception("пайплайн пустой");
    }

    return GenderPipeline(_parsers);
  }
}
