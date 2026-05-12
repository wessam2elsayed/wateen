
abstract class AzkarRepository {
  int getAzkarCount(String zkrTitle);
  Future<void> updateAzkarCount(String zkrTitle, int count);
  double calculateAzkarProgress();
  Future<void> clearData();
  
}