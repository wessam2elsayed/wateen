import 'package:bloc/bloc.dart';
import 'package:wateen/featuers/azkar/data/repository/azkar_repository.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {

  final AzkarRepository azkarRepository;
  AzkarCubit({required this.azkarRepository}) : super(AzkarInitial());

  Future<void> updateAzkarCount(String zkrTitle, int count) async {
    try{
      await azkarRepository.updateAzkarCount(zkrTitle, count);
    emit(AzkarLoaded(lastUpdatedZkr: zkrTitle, count: count));
    }catch(e){
      emit(AzkarError(e.toString()));

    }
  }
  

  int getZkrCount(String zkrTitle) {
    return azkarRepository.getAzkarCount(zkrTitle);
  }
}
