import 'dart:convert';

import 'package:ProjectOne/domain/user_education.dart';
import 'package:ProjectOne/domain/user_experience.dart';

class UserInfo{


  int id;
  String name,avatar,email;
  List<UserEducation> userEducation=[];
  List<UserExperience> userExperience=[];


  UserInfo.fromJson(Map<String,dynamic>jsonData){
    print('jsondata');
    print(jsonData);
  this.id = jsonData['id'];
  this.name = jsonData['name'];
  print('name');
  print(this.name);
  this.avatar = jsonData['avatar'];
  this.email = jsonData['email'];
    _setUserExperience(jsonData['experiences']);
  _setUserEducation(jsonData['educations']);


  }


  UserInfo({this.id, this.name, this.avatar, this.userEducation,
  this.userExperience});

  _setUserEducation(List<dynamic>jsonEducations) {

  print('length');
  print(jsonEducations.length);
  if(jsonEducations.length>0){

  for(var education in jsonEducations ){
    print('eduu');
    print(education);
    print('howww');
   UserEducation userEducation = UserEducation.fromJson(education);
     this.userEducation.add(userEducation);
  print('eee');

  }

  }
  print('oo');
  print(userEducation);
}


  _setUserExperience(List<dynamic>jsonExperiences){

  if(jsonExperiences.length>0){

  for(var experience in jsonExperiences ){

    UserExperience userExperience = UserExperience.formJson(experience);
  this.userExperience.add(userExperience);
  }
print('done');
 }
}



}

