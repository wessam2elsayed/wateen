import 'package:hive/hive.dart';
import 'package:wateen/core/utils/app_strings.dart';
import 'package:wateen/featuers/azkar/data/repository/azkar_repository.dart';
import 'package:wateen/featuers/home/data/repository/home_repository.dart';
import 'package:wateen/featuers/prayer/data/repository/prayer_repository.dart';
import 'package:wateen/featuers/quran/data/repository/quran_repository.dart';

class HomeRepositoryImplementation implements HomeRepository{
  final PrayerRepository prayerRepo;
  final AzkarRepository azkarRepo;
  final QuranRepository quranRepo;
  final Box _habitBox;

  HomeRepositoryImplementation({
    required this.prayerRepo, 
    required this.azkarRepo, 
    required this.quranRepo,  
    required Box habitBox,
    }) : _habitBox = habitBox;

  @override
  Future<Map<String, dynamic>> getHomeSummary()async {
    final now = DateTime.now();
    // final today = "2026-05-12";
    final today = "${now.year}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}";
    String lastEntryDate = _habitBox.get('lastEntryDate', defaultValue: "");
    bool isNewDay = lastEntryDate != today;

    await resetForNewDay();

    int donePrayers = 0;
    for (var p in ["Fagr", "Dhuhr", "Asr", "Maghrib", "Ishaa"]) {
      if (prayerRepo.getPrayerStatus(p)) donePrayers++;
    }
    double prayerPercent = donePrayers / 5.0;



    int lastPageYesterday = _habitBox.get('lastPageYesterday', defaultValue: 0);
    int currentPageNow = quranRepo.getLastPage();
    double quranPercent = (currentPageNow > lastPageYesterday) ? 1.0 : 0.0;


    bool morning = azkarRepo.getAzkarCount(AppStrings.morningAzkar) >= 1;
    bool evening = azkarRepo.getAzkarCount(AppStrings.eveningAzkar) >= 1;
    double azkarPercent = (morning && evening) ? 1.0 : (morning || evening ? 0.5 : 0.0);
    
    if (!isNewDay || lastEntryDate == "") {
    _updateStreak(prayerPercent, quranPercent, azkarPercent);
  }

     return {
      'prayerProgress': prayerPercent,
      'quranProgress': quranPercent,
      'azkarProgress': azkarPercent,
      'streak': _habitBox.get('streakCount',defaultValue: 0), 

    };
  }
  
  @override
  Future <void> resetForNewDay()async {
    final now = DateTime.now();
    // final today = "2026-05-12";
    final today = "${now.year}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}";
    String lastEntryDate = _habitBox.get('lastEntryDate', defaultValue: "");

    if (lastEntryDate != today ) {
      if( lastEntryDate != ""){
        await prayerRepo.clearData(); 
        await azkarRepo.clearData();  

        int currentPage = quranRepo.getLastPage();
        _habitBox.put('lastPageYesterday', currentPage); 

      } 
      _habitBox.put('lastEntryDate', today);
      
    }
  }
  

  void _updateStreak(double p, double q, double a) {
    double total = (p + q + a) / 3;
    if (total >= 1.0) {
      final now = DateTime.now();
      // final todayStreak = "2026-05-12";
      final todayStreak = "${now.year}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}";
      
      String lastCompletionDate = _habitBox.get('lastCompletionDate', defaultValue: "");
      int Streak = _habitBox.get('streakCount', defaultValue: 0);

      if (lastCompletionDate == todayStreak) {
      return; 
      }

      if (lastCompletionDate == "") {
        _habitBox.put('streakCount', 1);
      }else{
        try{
          DateTime lastDateParsed = DateTime.parse(lastCompletionDate);
          DateTime lastDate = DateTime(lastDateParsed.year, lastDateParsed.month, lastDateParsed.day);
          DateTime todayDate = DateTime(now.year, now.month, now.day);
          final diff = todayDate.difference(lastDate).inDays;
         
          if (diff == 1){
            _habitBox.put('streakCount', Streak + 1);
          } else if (diff > 1) {
            _habitBox.put('streakCount', 1);
          }
          }catch(e){
             _habitBox.put('streakCount', 1);
          }
      }
      _habitBox.put('lastCompletionDate', todayStreak);
    }
  }

}