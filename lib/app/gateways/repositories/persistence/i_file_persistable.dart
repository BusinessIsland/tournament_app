abstract class IFilePersistable {
  Future<void> saveToFile(String filePath);
  Future<void> loadFromFile(String filePath);
}