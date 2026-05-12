import 'package:hive/hive.dart';
import 'package:wateen/core/utils/app_strings.dart';
import 'package:wateen/featuers/azkar/data/repository/azkar_repository.dart';

class AzkarRepositoryImplementation implements AzkarRepository{
  final _azkarBox = Hive.box('azkarBox');

  @override
  int getAzkarCount(String zkrTitle) {
    return _azkarBox.get(zkrTitle, defaultValue: 0);
  }

  @override
  Future<void> updateAzkarCount(String zkrTitle, int count) async{
   await  _azkarBox.put(zkrTitle, count); 
  }

  @override
  double calculateAzkarProgress() {
    List<Map<String, dynamic>> azkars = [
    {"title": AppStrings.subhanAllah, "target": 33},
    {"title": AppStrings.alhamdulilah, "target": 33},
    {"title": AppStrings.allahAkbar, "target": 33},
    {"title": AppStrings.laEllahEllaAllah, "target": 1},
    {"title": AppStrings.astaghfarAllah, "target": 100},
    ];
    double totalProgress = 0;
    for (var zkr in azkars) {
      int current = getAzkarCount(zkr['title']);
      totalProgress += (current / zkr['target']).clamp(0.0, 1.0);
    }
    return azkars.isEmpty
    ?0
    : totalProgress / azkars.length;
  }
  
  @override
  Future<void> clearData() async{
    await _azkarBox.clear();
  }
  
}