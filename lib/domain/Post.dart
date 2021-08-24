import 'dart:convert';

import 'package:ProjectOne/domain/job_role.dart';

class Post{
  int id;
  String title,jobType,startSalary,
      endSalary,experienceYears,description;

  JobRole jobRole;

  Post.fromJson(Map<String,dynamic>jsonData){
    this.id = jsonData['id'];
    this.title = jsonData['title'];
    this.jobType = jsonData['job_type'];
    this.startSalary = jsonData['start_salary'];
    this.endSalary = jsonData['end_salary'];

    this.experienceYears = jsonData['experience_years'].toString();
    this.description = jsonData['description'];

    this.jobRole = JobRole.formJson(jsonData['job_role_id']);

  }

  Post({this.title, this.jobType, this.startSalary, this.endSalary,
      this.experienceYears, this.description, this.jobRole});


}