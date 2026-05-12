part of 'prayer_cubit.dart';

abstract class PrayerState {}

final class PrayerInitial extends PrayerState {}

// final class PrayerLoading extends PrayerState {}

class PrayerLoaded extends PrayerState {
  final Map<String, bool> prayersStatus; 
  PrayerLoaded(this.prayersStatus);
}

final class PrayerUpdated extends PrayerState {}
