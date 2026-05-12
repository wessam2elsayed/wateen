class AzkarModel {
  final String title; 
  final String description;      
  final int targetCount;   
  int currentCount;         

  AzkarModel({
    required this.title, 
    required this.description,
    required this.targetCount, 
    this.currentCount = 0, 
    
  });
}