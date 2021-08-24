import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ProjectOne/domain/company.dart';
import 'package:ProjectOne/domain/user.dart';
import 'package:ProjectOne/util/app_url.dart';
import 'package:ProjectOne/util/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

Future<String> getToken(args) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("token");
  return token;
}

Future<bool> setToken(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('token', value);
}


class AuthProvider with ChangeNotifier {

  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;






  Future<bool> loginUser(String email, String password) async {
    var result;


    _loggedInStatus = Status.Authenticating;
    notifyListeners();
    Map<String,String>body={
      'email':email,
      'password':password
    };
    Response response = await post(
      AppUrl.loginUser,
      body: body,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode==201) {
      final Map<String, dynamic> responseData = json.decode(response.body);



      var body = responseData['data'];

      var userData = body['user'];

      User authUser = User.fromJson(userData);


      UserPreferences().saveUser(authUser,body['token']);


      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result=true;
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = false;
    }
    return result;
  }

  Future<Map<String, dynamic>> registerUser(String firstName,String lastName,String email,
      String password,String passwordConfirmation,FileImage avatar) async {


    Map<String,dynamic>body={
      'first_name':firstName,
      'last_name':lastName,
      'email':email,
      'password':password,
      'password_confirmation':passwordConfirmation,
      'tags[0]':'laravel',
    };
    print(body);
    return await post(AppUrl.registerUser,
        body: body,
        headers: {'Accept': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }



  static Future<FutureOr> onValue(Response response) async {
    print("teeesting");
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    print(response.statusCode);
    if (response.statusCode == 200) {

      var body = responseData['data'];

      var userData = body['user'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser,userData['token']);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
//      if (response.statusCode == 401) Get.toNamed("/login");
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }

    return result;
  }


  /****
   * Register Company
   */


  Future<Map<String, dynamic>> registerCompany(String name,String email,
      String password,String passwordConfirmation,String description) async {

    Map<String,dynamic>body={
      'name':name,
      'email':email,
      'password':password,
      'password_confirmation':passwordConfirmation,
      'description':description,
    };
    print(body);
    return await post(AppUrl.registerCompany,
        body: body,
        headers: {'Accept': 'application/json'})
        .then(onValueCompany)
        .catchError(onError);
  }




  /**
   * Login Company
   */


  Future<bool> loginCompany(String email, String password) async {
    var result;


    _loggedInStatus = Status.Authenticating;
    notifyListeners();


    Map<String,String>body={
      'email':email,
      'password':password
    };


    Response response = await post(
      AppUrl.loginCompany,
      body: body,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode==201) {
      final Map<String, dynamic> responseData = json.decode(response.body);


      var body = responseData['data'];
      var companyData = body['user'];


      Company authCompany = Company.fromJson(companyData);

      CompanyPreferences().saveCompany(authCompany, body['token']);
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result=true;
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = false;
    }
    return result;
  }



  static Future<FutureOr> onValueCompany(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {

      var body = responseData['data'];
      var companyData = body['user'];

      Company authCompany = Company.fromJson(companyData);

      CompanyPreferences().saveCompany(authCompany, body['token']);

      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authCompany
      };
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }

}