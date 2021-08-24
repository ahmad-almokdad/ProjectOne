class Company{

  int id;
  String name,email,password,description;

  Company({this.name, this.email, this.password, this.description});

  Company.fromJson(Map<String,dynamic>jsonData){
    this.name = jsonData['name'];
    this.email =jsonData['email'];
    this.password = jsonData['password'];
    this.description = jsonData['description'];

  }


}
