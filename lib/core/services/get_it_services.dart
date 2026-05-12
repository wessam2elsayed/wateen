import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:wateen/featuers/azkar/data/repository/azkar_repository.dart';
import 'package:wateen/featuers/azkar/data/repository/azkar_repository_implementation.dart';
import 'package:wateen/featuers/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:wateen/featuers/home/data/repository/home_repository.dart';
import 'package:wateen/featuers/home/data/repository/home_repository_implementation.dart';
import 'package:wateen/featuers/home/presentation/cubit/home_cubit.dart';
import 'package:wateen/featuers/prayer/data/repository/prayer_repository.dart';
import 'package:wateen/featuers/prayer/data/repository/prayer_repository_implementation.dart';
import 'package:wateen/featuers/prayer/presentation/cubit/prayer_cubit.dart';
import 'package:wateen/featuers/quran/data/repository/quran_repositorry_implementation.dart';
import 'package:wateen/featuers/quran/data/repository/quran_repository.dart';
import 'package:wateen/featuers/quran/presentation/cubit/quran_cubit.dart';
import 'package:wateen/featuers/settings/cubit/local/cubit/locale_cubit.dart';
import 'package:wateen/featuers/settings/cubit/theme/theme_cubit.dart';


 class GetItServices {
  static final getIt = GetIt.instance;

  static void setUp(){
    getIt.registerLazySingleton<PrayerRepository>(()=>PrayerRepositoryImplementation());
    getIt.registerFactory(()=>PrayerCubit(prayerRepository: getIt<PrayerRepository>()));

    getIt.registerLazySingleton<AzkarRepository>(() => AzkarRepositoryImplementation());
    getIt.registerFactory(() => AzkarCubit(azkarRepository: getIt<AzkarRepository>()));

    getIt.registerLazySingleton<QuranRepository>(() => QuranRepositorryImplementation());
    getIt.registerFactory(() => QuranCubit(quranRepository: getIt<QuranRepository>())); 

    getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImplementation(
       prayerRepo: getIt<PrayerRepository>(),
       azkarRepo: getIt<AzkarRepository>(),
       quranRepo: getIt<QuranRepository>(),
       habitBox: Hive.box('habitBox'), 
    ));
    
    getIt.registerFactory(() => HomeCubit(
      prayerRepo: getIt<PrayerRepository>(), 
      azkarRepo: getIt<AzkarRepository>(), 
      quranRepo: getIt<QuranRepository>(), 
      homeRepo:getIt<HomeRepository>()
      ));

    getIt.registerFactory(() => ThemeCubit());

    getIt.registerFactory(() => LocaleCubit());
  }
  
  
}