import 'package:hive/hive.dart';
import 'package:wateen/featuers/prayer/data/repository/prayer_repository.dart';

class PrayerRepositoryImplementation implements PrayerRepository{
  final _prayersBox = Hive.box('prayersBox');
  
  @override
  Future<void> togglePrayer(String prayerName, bool value) async {
    await _prayersBox.put(prayerName, value);
  }
  
  @override
  bool getPrayerStatus(String prayerName) {
    return _prayersBox.get(prayerName, defaultValue: false);
  }

  @override
  double calculatePrayerProgress() {
    List<String> prayers = ["Fagr", "Dhuhr", "Asr", "Maghrib", "Ishaa"];
    int count = 0;
    for (var p in prayers) {
      if (getPrayerStatus(p)) count++;
    }
    return count / prayers.length; 
  }
  
  @override
  Future<void> clearData() async{
    await _prayersBox.clear();
  }  
}