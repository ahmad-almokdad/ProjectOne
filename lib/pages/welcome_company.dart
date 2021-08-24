import 'package:flutter/material.dart';
import 'package:ProjectOne/domain/user.dart';
import 'package:ProjectOne/pages/company/add_post.dart';
import 'package:ProjectOne/pages/company/get_post.dart';
import 'package:ProjectOne/pages/login_company.dart';
import 'package:ProjectOne/providers/user_provider.dart';
import 'package:ProjectOne/util/shared_preference.dart';
import 'package:provider/provider.dart';

class WelcomeCompany extends StatelessWidget {


  // Welcome({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("WELCOME Company"),
            ),
            RaisedButton(
              child: Text('View Posts'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PostsPage()));
              },
            ),
            RaisedButton(
              child: Text('Add Post'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPost()));
              },
            ),
            RaisedButton(
              child: Text(
                'Log Out',
              ),
              onPressed: () {
                UserPreferences().removeUser();
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>LoginCompany()),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
