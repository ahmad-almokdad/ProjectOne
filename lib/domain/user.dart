import 'package:ProjectOne/domain/user_education.dart';
import 'package:ProjectOne/domain/user_experience.dart';


class User{
  int id;
  String name,avatar,email;
  List<UserEducation> userEducation;
  List<UserExperience> userExperience;


  User.fromJson(Map<String,dynamic>jsonDate){
    this.id = jsonDate['id'];
    this.name = jsonDate['name'];
    this.avatar = jsonDate['avatar'];
    this.email = jsonDate['email'];

  }


  User({this.id, this.name, this.avatar, this.userEducation,
      this.userExperience});

  _setUserEducation(List<dynamic>jsonEducations){
    this.userEducation = [];

    if(jsonEducations.length>0){

      for(var education in jsonEducations ){
        if(education!=null){
          this.userEducation.add(education);
        }
      }

    }
  }


  _setUserExperience(List<dynamic>jsonExperiences){
    this.userExperience = [];

    if(jsonExperiences.length>0){

      for(var experience in jsonExperiences ){
        if(experience!=null){
          this.userEducation.add(experience);
        }
      }

    }
  }

}