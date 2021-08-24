class Qualification{
  int id;
  String name;

  Qualification.fromJson(Map<String,dynamic>jsonDate){
    this.id = jsonDate['id'];
    this.name = jsonDate['name'];
  }
}