import 'package:bloc/bloc.dart';
import 'package:wateen/featuers/azkar/data/repository/azkar_repository.dart';
import 'package:wateen/featuers/home/data/repository/home_repository.dart';
import 'package:wateen/featuers/prayer/data/repository/prayer_repository.dart';
import 'package:wateen/featuers/quran/data/repository/quran_repository.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepo;
  final PrayerRepository prayerRepo;
  final AzkarRepository azkarRepo;
  final QuranRepository quranRepo;

  HomeCubit({
    required this.prayerRepo, 
    required this.azkarRepo,
    required this.quranRepo,
    required this.homeRepo,}) : super(HomeInitial());
    

  void fetchHomeData() async {
    emit(HomeLoading()); 
    homeRepo.resetForNewDay();
    try {
      final data = await homeRepo.getHomeSummary(); 
      emit(HomeLoaded(
        prayerProgress: data['prayerProgress'],
        azkarProgress: data['azkarProgress'],
        quranProgress: data['quranProgress'],
        streak: data['streak'],
      ));
    } catch (e) {
      emit(HomeError());
    }
  }
  
  }

