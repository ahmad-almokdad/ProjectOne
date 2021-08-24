import 'package:flutter/material.dart';
import 'package:ProjectOne/domain/user_info.dart';
import 'package:ProjectOne/pages/user/update_education.dart';
import 'package:ProjectOne/pages/user/update_experience.dart';
import 'package:ProjectOne/pages/user/user_request.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  UserInfo userInfo = UserInfo();

  UserRequest userRequest = UserRequest();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: FutureBuilder(
        future: userRequest.getProfileUser(),
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          print('too');
          print(snapShot.hasData);
          if (snapShot.hasData) {
            userInfo = snapShot.data;
            print('data');
            return Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 100, top: 20),
                  child: CircleAvatar(
                    radius: 50,
                    child: Container(
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
                Text(userInfo.name),
                SizedBox(height: 20,),
                Text('Educations'),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(

                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Qualification Name : ' +
                                    userInfo.userEducation[index].qualification
                                        .name,
                              ),
                              Text(
                                'instituation Name : ' +
                                    userInfo
                                        .userEducation[index].instituation_name,
                              ),
                              Text(
                                'Study Field : ' +
                                    userInfo.userEducation[index].study_field,
                              ),
                              Text(
                                'Start Date : ' +
                                    userInfo.userEducation[index].start_date,
                              ),
                              RaisedButton(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return UpdateEducation(userInfo.userEducation[index].id.toString());
                                  },),);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: userInfo.userEducation.length,
                  ),
                ),
                SizedBox(height: 20,),
                Text('Experience'),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Job Title  ' +
                                    userInfo.userExperience[index].job_title,
                              ),
                              Text(
                                'Company Name  ' +
                                    userInfo.userExperience[index].company_name,
                              ),
                              Text(
                                'Job Role ' +
                                    userInfo.userExperience[index].jobRole.name,
                              ),
                              Text(
                                'Start Date  ' +
                                    userInfo.userExperience[index].start_date,
                              ),
                              RaisedButton(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return UpdateExperience(userInfo.userExperience[index].id.toString());
                                  },),);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: userInfo.userExperience.length,
                  ),
                ),
              ],
            );
          }

          return CircularProgressIndicator();
        },

      ),
    );
  }
}
