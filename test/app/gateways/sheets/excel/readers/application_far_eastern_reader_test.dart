import 'package:excel/excel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tournament_app/app/exceptions/entity_not_found.dart';
import 'package:tournament_app/app/exceptions/sheet_not_found_exception.dart';
import 'package:tournament_app/app/gateways/sheets/dto/participant_sheet_dto.dart';
import 'package:tournament_app/app/gateways/sheets/excel/readers/application_far_eastern_reader.dart';
import 'package:uuid/uuid.dart';

void main() {
  late ApplicationFarEasternReader reader;
  late Excel excel;

  setUp(() {
    reader = ApplicationFarEasternReader();
    excel = Excel.createExcel();
    // Инициализируем необходимые листы
    excel.rename("Sheet1", reader.mainSheetName);
    excel[reader.appSheetName];
  });

  group('ApplicationFarEasternReader - Basic Validation', () {
    test('should throw SheetNotFoundException if main sheet is missing', () {
      final emptyExcel = Excel.createExcel(); // Только Sheet1
      expect(() => reader.readAll(emptyExcel), throwsA(isA<SheetNotFoundException>()));
    });
  });

  group('ApplicationFarEasternReader - CRUD Operations', () {
    // Вспомогательный метод для создания тестового DTO
    ParticipantSheetDto createTestDto({String? id}) {
      return ParticipantSheetDto.withValidation(
        rawId: id ?? "550e8400-e29b-41d4-a716-446655440000",
        rawRowId: "1",
        rawGender: "м",
        rawFullname: "Иванов Иван Иванович",
        rawDateOfBirth: "01.01.2010",
        rawBelt: "1 кю",
        rawSportsTitle: "КМС",
        rawWeight: "60.5",
        rawRegion: "Приморье",
        rawTrainers: "Петров П.П.",
        rawBlock: "A",
      );
    }

    test('should create a record and map it to both sheets', () {
      final destExcel = Excel.createExcel();
      destExcel[reader.mainSheetName];
      destExcel[reader.appSheetName];

      final dto = createTestDto();
      final saved = reader.create(excel, destExcel, dto);

      final mainSheet = destExcel[reader.mainSheetName];
      final appSheet = destExcel[reader.appSheetName];

      // Проверяем, что в основной лист записалось ФИО
      expect(mainSheet.rows[1][reader.mainColFullname]?.value.toString(), contains("Иванов"));
      // Проверяем, что в служебный лист записался UUID
      expect(appSheet.rows[1][reader.appColId]?.value.toString(), equals(dto.id.value));
      expect(saved.rowId.value, isNotNull);
    });

    test('readAll should return all participants except empty rows', () {
      final destExcel = Excel.createExcel();
      destExcel[reader.mainSheetName];
      destExcel[reader.appSheetName];

      final uuid = Uuid();
      reader.create(excel, destExcel, createTestDto(id: uuid.v4()));

      final result = reader.readAll(destExcel);
      expect(result.length, 1);
      expect(result.first.name.lastname, "Иванов");
    });

    test('readAll should handle ISO 8601 dates and mixed separators in weight', () {
      final destExcel = Excel.createExcel();
      destExcel[reader.mainSheetName];
      destExcel[reader.appSheetName];

      final dto = ParticipantSheetDto.withValidation(
        rawId: Uuid().v4(),
        rawRowId: "1",
        rawGender: "ж",
        rawFullname: "Петрова Анна Сергеевна",
        rawDateOfBirth: "2012-05-20T00:00:00.000Z", // Тот самый ISO формат
        rawBelt: "2 кю",
        rawSportsTitle: "б/р",
        rawWeight: "55,7", // Запятая вместо точки
        rawRegion: "Хабаровск",
        rawTrainers: "Сидоров А.А.",
        rawBlock: "B",
      );

      reader.create(excel, destExcel, dto);
      final result = reader.readAll(destExcel);

      expect(result.first.dateOfBirth.value.year, 2012);
      expect(result.first.weight.value, 55.7);
    });

    test('getById should find participant in the service sheet', () {
      final destExcel = Excel.createExcel();
      destExcel[reader.mainSheetName];
      destExcel[reader.appSheetName];

      final uuid = Uuid();
      final targetId = uuid.v4();

      final originalDto = createTestDto(id: targetId);
      reader.create(excel, destExcel, originalDto);

      final found = reader.getById(destExcel, targetId);
      expect(found.id.value, targetId);
      expect(found.name.lastname, "Иванов");
    });

    test('getById: should throw EntityNotFound when ID does not exist', () {
      final destExcel = Excel.createExcel();
      destExcel[reader.mainSheetName];
      destExcel[reader.appSheetName];

      expect(
            () => reader.getById(destExcel, "non-existent-uuid"),
        throwsA(isA<EntityNotFound>()),
      );
    });

    test('update: should correctly modify existing record and keep other data', () {
      final sourceExcel = Excel.createExcel();
      sourceExcel[reader.mainSheetName];
      sourceExcel[reader.appSheetName];

      final targetId = Uuid().v4();
      final originalDto = createTestDto(id: targetId);

      final midExcel = Excel.createExcel();
      midExcel[reader.mainSheetName];
      midExcel[reader.appSheetName];

      // Сначала создаем
      reader.create(excel, midExcel, originalDto);

      // Данные для обновления (меняем только фамилию и вес)
      final updatedDto = ParticipantSheetDto.withValidation(
        rawId: targetId,
        rawRowId: "1",
        rawGender: "м",
        rawFullname: "Сидоров Иван Иванович",
        rawDateOfBirth: "01.01.2010",
        rawBelt: "1 кю",
        rawSportsTitle: "КМС",
        rawWeight: "65.0", // Новый вес
        rawRegion: "Приморье",
        rawTrainers: "Петров П.П.",
        rawBlock: "A",
      );

      final finalExcel = Excel.createExcel();
      finalExcel[reader.mainSheetName];
      finalExcel[reader.appSheetName];

      reader.update(midExcel, finalExcel, targetId, updatedDto);

      final result = reader.getById(finalExcel, targetId);
      expect(result.name.lastname, "Сидоров");
      expect(result.weight.value, 65.0);
    });

    test('delete should skip specified IDs during copy', () {
      final sourceExcel = Excel.createExcel();
      sourceExcel[reader.mainSheetName];
      sourceExcel[reader.appSheetName];

      final uuid = Uuid();
      final targetId1 = uuid.v4();
      final targetId2 = uuid.v4();

      // Создаем двух участников
      final dto1 = createTestDto(id: targetId1);
      final dto2 = createTestDto(id: targetId2);

      final midExcel = Excel.createExcel();
      midExcel[reader.mainSheetName];
      midExcel[reader.appSheetName];

      reader.create(sourceExcel, midExcel, dto1);
      reader.create(midExcel, sourceExcel, dto2); // Обновляем source

      final finalExcel = Excel.createExcel();
      finalExcel[reader.mainSheetName];
      finalExcel[reader.appSheetName];

      // Удаляем первого
      reader.delete(sourceExcel, finalExcel, [targetId1]);

      final result = reader.readAll(finalExcel);
      expect(result.length, 1);
      expect(result.first.id.value, targetId2);
    });

    test('delete: should do nothing if ids list is empty (just copy)', () {
      final sourceExcel = Excel.createExcel();
      sourceExcel[reader.mainSheetName];
      sourceExcel[reader.appSheetName];

      reader.create(excel, sourceExcel, createTestDto());

      final destExcel = Excel.createExcel();
      destExcel[reader.mainSheetName];
      destExcel[reader.appSheetName];

      reader.delete(sourceExcel, destExcel, []); // Пустой список на удаление

      final result = reader.readAll(destExcel);
      expect(result.length, 1); // Участник остался на месте
    });
  });
}