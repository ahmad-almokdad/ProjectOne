import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:ProjectOne/domain/user_education.dart';
import 'package:ProjectOne/domain/user_experience.dart';
import 'package:ProjectOne/domain/user_info.dart';
import 'package:ProjectOne/util/app_url.dart';
import 'package:ProjectOne/util/shared_preference.dart';

class UserRequest{

  Future<UserExperience>addExperience(String job_title,String company_name,String job_role_id,String start_date,String end_date)async{
    String token = await UserPreferences().getToken();

    Map<String,String>headers = {
      'Accept' : 'application/json',
    'Authorization': 'Bearer $token',
    };
print('headers');
print(headers);
    Map<String,dynamic>body = {
      'job_title':job_title,
      'company_name':company_name,
      'job_role_id':job_role_id,
      'start_date':start_date,
      'end_date':'2020/9/8',
    };

    var response = await http.post(AppUrl.ADD_EXPERIENCE_URL,headers: headers,body: body);

    print(response.statusCode);

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      var data = body['data'];
      print('data');
      print(data);
      UserExperience userExperience = UserExperience.formJson(data);
      return userExperience;
    }
    throw Exception();

  }




  Future<void>updateExperience(String job_title,String company_name,String job_role_id,String start_date,String end_date,String idExperience)async{


    String token = await UserPreferences().getToken();
    print('teesi');
    String userId = await UserPreferences().getId();
    print(token);
    Map<String,String>headers = {
      'Accept' : 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String,dynamic>body = {
      'job_title':job_title,
      'company_name':company_name,
      'job_role_id':job_role_id,
      'start_date': start_date,
      'end_date':'2020/9/8',
    };
    var response = await http.post(AppUrl.UPDATE_EXPERIENCE_URL+idExperience,headers: headers,body: body);
print(response.statusCode);
print(AppUrl.UPDATE_EXPERIENCE_URL+idExperience);
print('statues');

    if(response.statusCode == 200 || response.statusCode == 201 ){
      var body = jsonDecode(response.body);
      var data = body['data'];
      print('data here');
      print(data);
      UserExperience userExperience = UserExperience.formJson(data);
      return userExperience;
    }
    throw Exception();

  }




  Future<void>updateEducation(String instituationName,String studyField,String qualificationId,String start_date,String end_date,String idEducation)async{


    String token = await UserPreferences().getToken();
    Map<String,String>headers = {
      'Accept' : 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String,dynamic>body = {
      'instituation_name':instituationName,
      'study_field':studyField,
      'qualification_id':qualificationId,
      'start_date': start_date,
      'end_date':'2020/9/8',
    };


    var response = await http.post(AppUrl.UPDATE_EDUCATION_URL+idEducation,headers: headers,body: body);
    if(response.statusCode == 200 || response.statusCode == 201 ){
      var body = jsonDecode(response.body);
      var data = body['data'];
      UserEducation userEducation = UserEducation.fromJson(data);
      return userEducation;
    }
    throw Exception();

  }









  Future<UserInfo> getProfileUser()async{

    String token = await UserPreferences().getToken();


    Map<String,String>headers = {
      'Accept' : 'application/json',
      'Authorization': 'Bearer $token',
    };


    var response = await http.get(AppUrl.getProfile,headers: headers);

    print(response.statusCode);
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      print('body');
      print(body['data']);

      UserInfo userInfo =  UserInfo.fromJson(body['data']);
      print('userInfo');
      print(userInfo.name);
      return userInfo;

 }
    return null;

  }







}