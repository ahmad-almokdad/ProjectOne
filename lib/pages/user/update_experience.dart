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
class UpdateExperience extends StatefulWidget {
  @override
  _UpdateExperienceState createState() => _UpdateExperienceState();
  String idExperience;

  UpdateExperience(this.idExperience);

}

class _UpdateExperienceState extends State<UpdateExperience> {
  final formKey = new GlobalKey<FormState>();



  String jobTitle, companyName;
  String jobRoleId; //??
  String startDate;


  @override
  Widget build(BuildContext context) {

    final jobTitleField = TextFormField(
      autofocus: false,
      onSaved: (value) => jobTitle = value,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );
    final companyNameField = TextFormField(
      autofocus: false,
      onSaved: (value) => companyName = value,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );
    final jobRoleIdField = TextFormField(
      autofocus: false,
      onSaved: (value) => jobRoleId = value,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );
    final startDateField = TextFormField(
      autofocus: false,
      onSaved: (value) => startDate = value,
      decoration: InputDecoration(
        hintText: "Enter Date Like 9/9/9999",
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
        print(widget.idExperience);
        var test = UserRequest().updateExperience(jobTitle, companyName, jobRoleId, startDate, null,widget.idExperience);
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
                label("job title"),
                SizedBox(height: 5.0),
                jobTitleField,
                SizedBox(height: 20.0),
                label("company name"),
                SizedBox(height: 5.0),
                companyNameField,
                SizedBox(height: 20.0),
                label("job role id"),
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
