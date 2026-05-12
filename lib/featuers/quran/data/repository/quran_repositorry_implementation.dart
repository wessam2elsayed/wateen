import 'package:hive/hive.dart';
import 'package:wateen/core/utils/app_strings.dart';
import 'package:wateen/featuers/quran/data/repository/quran_repository.dart';

class QuranRepositorryImplementation implements QuranRepository{

  final _quranBox = Hive.box('quranBox');

   @override
  int getLastPage() {
   return _quranBox.get('lastPage', defaultValue: 0);
  }

  @override
   String getLastSurah() {
   return _quranBox.get('lastSurah',defaultValue: AppStrings.startReading);
  }

  @override
  double calculateQuranProgress() {
    int lastPage = getLastPage();
    return lastPage > 0 ? 1.0 : 0.0;
  }

  @override
  Future<void> updateQuranProgress(int newPage, String surahName) async {
    int previousPage = getLastPage();

  if (newPage > previousPage&& surahName.isNotEmpty) {
    _quranBox.put('lastPage', newPage);
    _quranBox.put('lastSurah', surahName);
     
  }
  }

}