class HabitModel {
  final String title;
  final String lottiePath;
  final String routeName;
  bool isCompleted;

  HabitModel({
    required this.title, 
    required this.lottiePath, 
    required this.routeName,  
    this.isCompleted= false});

  Map<String,dynamic> toMap(){
    return {
      "title": title,
      "lottiePath": lottiePath,
      "routeName": routeName,
      "isCompleted": isCompleted,
    };
  }  

  factory HabitModel.fromMap(Map<dynamic,dynamic> json){
    return HabitModel(
      title: json["title"], 
      lottiePath:  json["lottiePath"], 
      routeName:  json["routeName"],
      isCompleted: json["isCompleted"] ?? false,
      );
  }
}