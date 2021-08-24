import 'package:ProjectOne/domain/job_role.dart';

class UserExperience{

  int id;
  String job_title,company_name;
  JobRole jobRole;
  String start_date;
  String end_date;

  UserExperience.formJson(Map<String,dynamic>jsonData){
   this.id = jsonData['id'];
   this.job_title = jsonData['job_title'];
   this.company_name = jsonData['company_name'];
   this.jobRole = JobRole.formJson(jsonData['job_role']);
   this.start_date = jsonData['start_date'];
   if(jsonData['end_date'] != null){
     this.end_date = jsonData['end_date'];
   }
  }

}