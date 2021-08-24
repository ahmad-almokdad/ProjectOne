class JobRole{

int id;
String name;

JobRole.formJson(Map<String,dynamic>jsonData){
  this.id = jsonData['id'];
  this.name = jsonData['name'];
}

}
