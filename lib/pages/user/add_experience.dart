//import 'package:flutter/material.dart';
//
//
//
//class AddExperience extends StatefulWidget {
//  @override
//  _AddExperienceState createState() => _AddExperienceState();
//}
//
//class _AddExperienceState extends State<AddExperience> {
//  final formKey = GlobalKey<FormState>();
//
//
//  DateTime dateStarting = DateTime.now();
//  bool _pickedStarting = false;
//
//  Future _pickStartingDate(BuildContext context) async {
//    final DateTime pickedstarting = await showDatePicker(
//      context: context,
//      initialDate: dateStarting,
//      firstDate: DateTime(1940),
//      lastDate: DateTime.now(),
//    );
//    if (pickedstarting != null && pickedstarting != dateStarting) {
//      setState(() {
//        dateStarting = pickedstarting;
//        _pickedStarting = true;
//        // print('\n the date : ${date.year}-${date.month}-${date.day}\n');
//      });
//    }
//  }
//
//
//  DateTime dateEnding = DateTime.now();
//  bool _pickedEnding = false;
//
//  Future _pickEndingDate(BuildContext context) async {
//    final DateTime pickedEnding = await showDatePicker(
//      context: context,
//      initialDate: dateEnding,
//      firstDate: DateTime(1940),
//      lastDate: DateTime.now(),
//    );
//    if (pickedEnding != null && pickedEnding != dateStarting) {
//      setState(() {
//        dateEnding = pickedEnding;
//        _pickedEnding = true;
//        // print('\n the date : ${date.year}-${date.month}-${date.day}\n');
//      });
//    }
//  }
//
//
//
//  var doAdd = () {
//    final form = formKey.currentState;
//
//    final form =formKey.currentState;
//
//    if (form.validate()) {
//      form.save();
//
//
//      var test = auth.loginUser(_username, _password);
//      print(test);
//      print('test');
//
//      Navigator.pushReplacementNamed(context, '/dashboard');
//
//    } else {
//      print("form is invalid");
//    }
//  };
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(),
//      body: Column(
//        children: <Widget>[
//          Form(
//            key: formkey,
//            child: Column(
//              children: <Widget>[
//                TextFormField(
//                  decoration: InputDecoration(
//                    hintText: "Job Title",
//                  ),
//                ),
//                TextFormField(
//                  decoration: InputDecoration(
//                    hintText: "Company Name",
//                  ),
//                ),
//                RaisedButton(
//                  onPressed: () {
//                    _pickStartingDate(context);
//                  },
//
//                  child: _pickedStarting
//                      ? Text(
//                    'Starting in ${dateStarting.year}-${dateStarting.month}-${dateStarting.day}',
//                    style: TextStyle(
//                        color: Theme.of(context).primaryColor,
//                        fontSize: 15),
//                  )
//                      : Text(
//                    'Starting studying in :',
//                    style: TextStyle(
//                        color: Theme.of(context).primaryColor,
//                        fontSize: 15),
//                  ),
//                ),
//
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}

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

class AddExperience extends StatefulWidget {
  @override
  _AddExperienceState createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
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

        var test = UserRequest().addExperience(jobTitle, companyName, jobRoleId, startDate, null);
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
