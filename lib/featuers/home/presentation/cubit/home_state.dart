part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState{}

class HomeLoaded extends HomeState{
  final double prayerProgress;
  final double azkarProgress;
  final double quranProgress;
  final int streak;

  HomeLoaded({
    required this.prayerProgress,
    required this.azkarProgress, 
    required this.quranProgress, 
    required this.streak});
}

final class HomeError extends HomeState{}
