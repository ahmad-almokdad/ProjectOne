import 'package:ProjectOne/domain/company.dart';
import 'package:ProjectOne/domain/user.dart';
import 'package:ProjectOne/domain/user_education.dart';
import 'package:ProjectOne/domain/user_experience.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(User user,String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();



    int id;
    String name,avatar;
    List<UserEducation> userEducation;
    List<UserExperience> userExperience;

    print('user');
    print(user.id);
    prefs.setString("userId", user.id.toString());
    prefs.setString("user", "user");
    prefs.setString("name", user.name);
    prefs.setString("avatar", user.avatar);
    prefs.setString('token', token);

    print("object prefere");
    print(token);


    return prefs.commit();
  }

  Future<List<String>> getUser() async {
    List<String>info = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String user = prefs.getString("user");
    info.add(user);

    String userId = prefs.getString("userId");
    String name = prefs.getString("name");
    String avatar = prefs.getString("avatar");
    String token = prefs.getString("token");
    info.add(token);
    print('token');
    print(token);

    return info;
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

//    prefs.remove("name");
//    prefs.remove("email");
     prefs.remove("user");
    prefs.remove("token");
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");


    return token;
  }

  Future<String> getId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId");
    return userId;
  }
}



class CompanyPreferences{


  Future<bool> saveCompany(Company company,String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", "company");
    prefs.setString("userId", company.id.toString());
    prefs.setString("name", company.name);
    prefs.setString('token', token);


    return prefs.commit();
  }




  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }

}
