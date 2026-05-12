abstract class HomeRepository {
  Future<Map<String, dynamic>> getHomeSummary();
  void resetForNewDay();
}