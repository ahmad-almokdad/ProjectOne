import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ProjectOne/domain/user.dart';
import 'package:ProjectOne/pages/company/company_request.dart';
import 'package:ProjectOne/pages/company/get_post.dart';
import 'package:ProjectOne/pages/login_company.dart';
import 'package:ProjectOne/pages/user/user_request.dart';
import 'package:ProjectOne/providers/auth.dart';
import 'package:ProjectOne/providers/user_provider.dart';
import 'package:ProjectOne/util/validators.dart';
import 'package:ProjectOne/util/widgets.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();

}

class _AddPostState extends State<AddPost> {
  final formKey = new GlobalKey<FormState>();



  String title,jobRoleId,jobType,startSalary,experienceYears,
      description;

  @override
  Widget build(BuildContext context) {

    final titleField = TextFormField(
      autofocus: false,
      onSaved: (value) => title = value,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );
    final jobRoleIdField = TextFormField(
      autofocus: false,
      onSaved: (value) => jobRoleId = value,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );
    final jobTypeField = TextFormField(
      autofocus: false,
      onSaved: (value) => jobType = value,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );final startSalaryField = TextFormField(
      autofocus: false,
      onSaved: (value) => startSalary = value,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );final experienceYearField = TextFormField(
      autofocus: false,
      onSaved: (value) => experienceYears = value,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );final descriptionField = TextFormField(
      autofocus: false,
      onSaved: (value) => description = value,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Authenticating ... Please wait")
      ],
    );


    var doAddExperience = () {
      final form = formKey.currentState;

      if (form.validate()) {
        form.save();


        var test = CompanyRequest().addPost(title, jobRoleId,jobType, startSalary, experienceYears, description, null);
        print(test);
        print('testddd');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PostsPage()));
      } else {
        print("form is invalid");
      }
    };

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: formKey,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.0),
                label("title"),
                SizedBox(height: 5.0),
                titleField,
                SizedBox(height: 20.0),
                label("Job Role ID"),
                SizedBox(height: 5.0),
                jobRoleIdField,
                SizedBox(height: 20.0),
                label("jobTypeField"),
                SizedBox(height: 5.0),
                jobTypeField,
                SizedBox(height: 20.0),
                label("Start Salary"),
                SizedBox(height: 5.0),
                startSalaryField,
                SizedBox(height: 20.0),
                label("Experience Years"),
                SizedBox(height: 5.0),
                experienceYearField,
                SizedBox(height: 20.0),
                label("Description"),
                SizedBox(height: 5.0),
                descriptionField,

                SizedBox(height: 20.0),
                RaisedButton(
                  child: Text("Add Experience"),
                  onPressed: (){
                    doAddExperience();
                  },
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
