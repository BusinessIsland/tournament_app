abstract class FilePersistable {
  Future<void> saveToFile(String filePath);
  Future<void> loadFromFile(String filePath);
}