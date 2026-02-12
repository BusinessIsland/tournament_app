import 'package:tournament_app/app/domain/parts/belt/parser/belt_parser_registry.dart';
import 'package:tournament_app/app/domain/parts/belt/parser/belt_pattern_parser.dart';
import 'package:tournament_app/app/domain/parts/belt/parser/belt_pipeline.dart';

class BeltPipelineBuilder {
  final List<BeltPatternParser> _parsers = [];

  void _add(BeltPatternParser parser) {
    _parsers.add(parser);
  }

  BeltPipelineBuilder addKuBelt() {
    _add(BeltParserRegistry.kuBelt);
    return this;
  }

  BeltPipelineBuilder addDanBelt() {
    _add(BeltParserRegistry.danBelt);
    return this;
  }

  BeltPipeline build() {
    if (_parsers.isEmpty) {
      throw Exception("пайплайн пустой");
    }

    return BeltPipeline(List.unmodifiable(_parsers));
  }
}
