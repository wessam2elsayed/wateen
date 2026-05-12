import 'package:bloc/bloc.dart';
import 'package:wateen/featuers/prayer/data/repository/prayer_repository.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  final PrayerRepository prayerRepository;
  PrayerCubit({required this.prayerRepository}) : super(PrayerInitial());
  

  void getPrayers() {
    // emit(PrayerLoading());
  final status = {
    "Fagr": prayerRepository.getPrayerStatus("Fagr"),
    "Dhuhr": prayerRepository.getPrayerStatus("Dhuhr"),
    "Asr": prayerRepository.getPrayerStatus("Asr"),
    "Maghrib": prayerRepository.getPrayerStatus("Maghrib"),
    "Ishaa": prayerRepository.getPrayerStatus("Ishaa"),
  };
  emit(PrayerLoaded(status));
}

  void changePrayerStatus(String name, bool value) async {
    await prayerRepository.togglePrayer(name, value);
    getPrayers();
  }
}
