import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ProjectOne/domain/user.dart';
import 'package:ProjectOne/pages/login_company.dart';
import 'package:ProjectOne/pages/user/user_request.dart';
import 'package:ProjectOne/providers/auth.dart';
import 'package:ProjectOne/providers/user_provider.dart';
import 'package:ProjectOne/util/validators.dart';
import 'package:ProjectOne/util/widgets.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UpdateEducation extends StatefulWidget {
  @override
  _UpdateEducationState createState() => _UpdateEducationState();
  String idEducation;

  UpdateEducation(this.idEducation);

}

class _UpdateEducationState extends State<UpdateEducation> {
  final formKey = new GlobalKey<FormState>();


  String qualificationId,instituationName,studyField,startDate;

//  String jobTitle, companyName;
//  String jobRoleId; //??
//  String startDate;


  @override
  Widget build(BuildContext context) {

    final jobTitleField = TextFormField(
      autofocus: false,
      onSaved: (value) => instituationName = value,
      decoration: buildInputDecoration("instituation Name", Icons.email),
    );
    final companyNameField = TextFormField(
      autofocus: false,
      onSaved: (value) => studyField = value,
      decoration: buildInputDecoration("Study Field", Icons.email),
    );
    final jobRoleIdField = TextFormField(
      autofocus: false,
      onSaved: (value) => qualificationId = value,
      decoration: buildInputDecoration("Qualification Id", Icons.email),
    );
    final startDateField = TextFormField(
      autofocus: false,
      onSaved: (value) => startDate = value,
      decoration: InputDecoration(
        hintText: "Enter Date Like 9999/9/9",
        icon: Icon(Icons.date_range),
      ),


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

        print('idEperience');
        print(widget.idEducation);
        var test = UserRequest().updateEducation(instituationName, studyField, qualificationId, startDate, null, widget.idEducation);
        print(test);
        print('test');

        Navigator.pop(context);
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
                label("instituation Name"),
                SizedBox(height: 5.0),
                jobTitleField,
                SizedBox(height: 20.0),
                label("study field"),
                SizedBox(height: 5.0),
                companyNameField,
                SizedBox(height: 20.0),
                label("qualification id"),
                SizedBox(height: 5.0),
                jobRoleIdField,
                SizedBox(height: 20.0),
                label("start date"),
                SizedBox(height: 5.0),
                startDateField,
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
