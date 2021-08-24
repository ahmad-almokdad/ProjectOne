import 'package:ProjectOne/domain/qualification.dart';

class UserEducation{
  int id;
  Qualification qualification;
  String instituation_name;
  String study_field;
  String start_date;
  String end_date;


  UserEducation.fromJson(Map<String,dynamic>jsonData){
    print('heeere');
    print(jsonData);
    print(jsonData['id']);
    this.id = jsonData['id'];
    this.qualification = Qualification.fromJson(jsonData['qualification']);
    this.instituation_name = jsonData['instituation_name'];
    this.study_field = jsonData['study_field'];
    this.start_date = jsonData['start_date'];
    this.end_date = jsonData['end_date'];
  }
}