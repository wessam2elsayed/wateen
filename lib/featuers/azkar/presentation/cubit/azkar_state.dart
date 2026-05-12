part of 'azkar_cubit.dart';

abstract class AzkarState {}

final class AzkarInitial extends AzkarState {}

class AzkarLoaded extends AzkarState {
  final String lastUpdatedZkr;
  final int count;

  AzkarLoaded({
    required this.lastUpdatedZkr, 
    required this.count});
}

class AzkarError extends AzkarState {
  final String message;

  AzkarError(this.message);
}
