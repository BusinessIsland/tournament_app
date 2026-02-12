import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_parser_registry.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_pattern_parser.dart';
import 'package:tournament_app/app/models/parts/sports_qualification/parser/sports_qualification_pipeline.dart';

class SportsQualificationPipelineBuilder {
  final List<SportsQualificationPatternParser> _parsers = [];

  void _add(SportsQualificationPatternParser parser) {
    _parsers.add(parser);
  }

  // Adult ranks
  SportsQualificationPipelineBuilder addFirstAdult() {
    _add(SportsQualificationParserRegistry.firstAdult());
    return this;
  }

  SportsQualificationPipelineBuilder addSecondAdult() {
    _add(SportsQualificationParserRegistry.secondAdult());
    return this;
  }

  SportsQualificationPipelineBuilder addThirdAdult() {
    _add(SportsQualificationParserRegistry.thirdAdult());
    return this;
  }

  // Youth ranks
  SportsQualificationPipelineBuilder addFirstYouth() {
    _add(SportsQualificationParserRegistry.firstYouth());
    return this;
  }

  SportsQualificationPipelineBuilder addSecondYouth() {
    _add(SportsQualificationParserRegistry.secondYouth());
    return this;
  }

  SportsQualificationPipelineBuilder addThirdYouth() {
    _add(SportsQualificationParserRegistry.thirdYouth());
    return this;
  }

  // Candidate rank
  SportsQualificationPipelineBuilder addCandidate() {
    _add(SportsQualificationParserRegistry.candidate());
    return this;
  }

  // Sports titles
  SportsQualificationPipelineBuilder addMaster() {
    _add(SportsQualificationParserRegistry.master());
    return this;
  }

  SportsQualificationPipelineBuilder addInternationalMaster() {
    _add(SportsQualificationParserRegistry.internationalMaster());
    return this;
  }

  SportsQualificationPipelineBuilder addGrandmaster() {
    _add(SportsQualificationParserRegistry.grandmaster());
    return this;
  }

  // Judges
  SportsQualificationPipelineBuilder addAllSportsJudge() {
    _add(SportsQualificationParserRegistry.allSportsJudge());
    return this;
  }

  SportsQualificationPipelineBuilder addFirstJudge() {
    _add(SportsQualificationParserRegistry.firstJudge());
    return this;
  }

  SportsQualificationPipelineBuilder addSecondJudge() {
    _add(SportsQualificationParserRegistry.secondJudge());
    return this;
  }

  SportsQualificationPipelineBuilder addThirdJudge() {
    _add(SportsQualificationParserRegistry.thirdJudge());
    return this;
  }

  SportsQualificationPipelineBuilder addYouthJudge() {
    _add(SportsQualificationParserRegistry.youthJudge());
    return this;
  }

  SportsQualificationPipeline build() {
    if (_parsers.isEmpty) {
      throw Exception("пайплайн пустой");
    }

    return SportsQualificationPipeline(List.unmodifiable(_parsers));
  }
}
