abstract class QuranRepository {
  int getLastPage();
  String? getLastSurah();
  double calculateQuranProgress();
  Future<void> updateQuranProgress(int newPage, String surahName);
}