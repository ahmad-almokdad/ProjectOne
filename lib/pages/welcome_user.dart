import 'package:flutter/material.dart';
import 'package:ProjectOne/domain/user.dart';
import 'package:ProjectOne/pages/login_user.dart';
import 'package:ProjectOne/pages/user/add_experience.dart';
import 'package:ProjectOne/pages/user/add_experience.dart';
import 'package:ProjectOne/pages/user/update_experience.dart';
import 'package:ProjectOne/pages/user/user_profile.dart';
import 'package:ProjectOne/providers/user_provider.dart';
import 'package:ProjectOne/util/shared_preference.dart';
import 'package:provider/provider.dart';

class WelcomeUser extends StatelessWidget {


  // Welcome({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome User'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(
              'Add Experience',
            ),
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) =>AddExperience()),);
            },
          ),
//          RaisedButton(
//            child: Text(
//              'Update Experience',
//            ),
//            onPressed: () {
//              Navigator.push(
//                context, MaterialPageRoute(builder: (context) =>UpdateExperience()),);
//            },
//          ),
          RaisedButton(
            child: Text(
              'User Profile',
            ),
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) =>UserProfile()),);
            },
          ),
          RaisedButton(
            child: Text(
              'Log Out',
            ),
            onPressed: () {
              UserPreferences().removeUser();
              Navigator.push(
                context, MaterialPageRoute(builder: (context) =>LoginUser()),);
            },
          ),

        ],
      ),
    );
  }
}
