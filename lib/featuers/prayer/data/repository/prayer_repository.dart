abstract class PrayerRepository {
  Future<void> togglePrayer(String name, bool value);
  bool getPrayerStatus(String name);
  double calculatePrayerProgress();
  Future<void> clearData();
}