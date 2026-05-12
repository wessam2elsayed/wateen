import 'package:bloc/bloc.dart';
import 'package:wateen/featuers/quran/data/repository/quran_repository.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  final QuranRepository quranRepository;
  QuranCubit({required this.quranRepository}) : super(QuranInitial());

  void getQuranData() {
    emit(QuranLoaded(
      lastPage: quranRepository.getLastPage(), 
      lastSurah: quranRepository.getLastSurah()));
  }
  

  Future<void> updateProgress(int newPage, String surahName) async{
    await quranRepository.updateQuranProgress(newPage, surahName);
    getQuranData();
  }
}
