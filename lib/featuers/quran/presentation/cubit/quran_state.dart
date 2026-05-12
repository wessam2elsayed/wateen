part of 'quran_cubit.dart';

abstract class QuranState {}

final class QuranInitial extends QuranState {}

final class QuranLoading extends QuranState {}

final class QuranLoaded extends QuranState {
  final int lastPage;
  final String? lastSurah;

  QuranLoaded({
    required this.lastPage, 
     this.lastSurah});
}
