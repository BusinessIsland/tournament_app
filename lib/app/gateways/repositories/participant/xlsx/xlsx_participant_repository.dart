import 'dart:io';
import 'package:tournament_app/app/domain/participant/container/impl/participant_list_basic_impl.dart';
import 'package:tournament_app/app/domain/participant/container/participant_list.dart';
import 'package:tournament_app/app/domain/participant/parser/participant_parser.dart';
import 'package:tournament_app/app/dto/participant/participant_create_dto.dart';
import 'package:tournament_app/app/dto/participant/participant_get_all_filter.dart';
import 'package:tournament_app/app/dto/participant/participant_update_dto.dart';
import 'package:tournament_app/app/gateways/repositories/participant/participant_repository.dart';
import 'package:tournament_app/app/gateways/repositories/persistence/file_persistable.dart';
import 'package:tournament_app/app/gateways/sheets/parsers/impl/xlsx_participant_parser.dart';
import 'package:tournament_app/app/models/participant/parser/participant_parser.dart';
import 'package:tournament_app/app/models/participant/participant.dart';
import 'package:tournament_app/app/models/participant/participant_list.dart';

class XlsxParticipantRepository
    implements ParticipantRepository, FilePersistable {
  ParticipantList _list = ParticipantListBasicImpl([]);
  final XlsxParticipantParser xlsxParser;
  final ParticipantParser participantParser;

  XlsxParticipantRepository({
    required this.xlsxParser,
    required this.participantParser,
  });

  @override
  ParticipantList getAll(ParticipantGetAllFilter filter) {
    final filtered = _list.where((p) {
      final isRegionPassed =
          filter.region == null || p.region.label == filter.region;
      final isTrainerPassed =
          filter.trainerName == null ||
          p.trainers.toString().contains(filter.trainerName!);
      return isRegionPassed && isTrainerPassed;
    });

    final finalList = ParticipantListBasicImpl();
    for (final participant in filtered) {
      finalList.add(participant);
    }

    return finalList;
  }

  @override
  Participant? getById(String id) {
    return _list.findById(id);
  }

  @override
  Participant create(ParticipantCreateDto dto) {
    final participant = participantParser.parse(
      dto.gender,
      dto.name,
      dto.dateOfBirth,
      dto.belt,
      dto.sportsQualification,
      dto.weight,
      dto.region,
      dto.trainers,
      dto.block,
    );

    _list.add(participant);
    return participant;
  }

  @override
  Participant update(ParticipantUpdateDto dto, String id) {
    final participant = participantParser.parse(
      dto.gender,
      dto.name,
      dto.dateOfBirth,
      dto.belt,
      dto.sportsQualification,
      dto.weight,
      dto.region,
      dto.trainers,
      dto.block,
    );

    final found = _list.findById(id);
    if (found == null) {
      _list.add(participant);
    }
    {
      _list.replace(participant, id);
    }

    return participant;
  }

  @override
  void delete(String id) {
    _list.delete(id);
  }

  @override
  Future<void> loadFromFile(String filePath) async {
    final source = File(filePath);
    _list = xlsxParser.parse(source);
  }

  @override
  Future<void> saveToFile(String filePath) async {
    xlsxParser.save(filePath, _list);
  }
}
