import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ProjectOne/domain/user.dart';
import 'package:ProjectOne/providers/auth.dart';
import 'package:ProjectOne/providers/user_provider.dart';
import 'package:ProjectOne/util/validators.dart';
import 'package:ProjectOne/util/widgets.dart';
import 'package:provider/provider.dart';

class RegisterCompany extends StatefulWidget {
  @override
  _RegisterCompanyState createState() => _RegisterCompanyState();
}

class _RegisterCompanyState extends State<RegisterCompany> {
  final formKey = new GlobalKey<FormState>();

  String name,email,password,passwordConfirmation,description;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);


    final nameField = TextFormField(
      autofocus: false,
      onSaved: (value) =>name = value,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );


    final emailField = TextFormField(
      autofocus: false,
      validator: validateEmail,
      onSaved: (value) => email = value,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );



    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      onSaved: (value) => password = value,
      decoration: buildInputDecoration("Confirm password", Icons.lock),
    );

    final confirmPasswordField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Your password is required" : null,
      onSaved: (value) => passwordConfirmation = value,
      obscureText: true,
      decoration: buildInputDecoration("Confirm password", Icons.lock),
    );


    final descriptionField = TextFormField(
      autofocus: false,
      onSaved: (value) =>description = value,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );


    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );

    var doRegister = () {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        auth.registerCompany(name, email, password, passwordConfirmation, description).then((response) {
          if (response['status']) {
            User user = response['data'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.pushReplacementNamed(context, '/dashboard');
          } else {
            Flushbar(
              title: "Registration Failed",
              message: response.toString(),
              duration: Duration(seconds: 10),
            ).show(context);
          }
        });
      } else {
        Flushbar(
          title: "Invalid form",
          message: "Please Complete the form properly",
          duration: Duration(seconds: 10),
        ).show(context);
      }

    };

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.0),
                label("Name"),
                SizedBox(height: 5.0),
                nameField,

                SizedBox(height: 15.0),
                label("Email"),
                SizedBox(height: 5.0),
                emailField,
                SizedBox(height: 15.0),
                label("password"),
                SizedBox(height: 5.0),
                passwordField,
                SizedBox(height: 15.0),
                label("FirstName"),
                SizedBox(height: 5.0),
                confirmPasswordField,
                SizedBox(height: 15.0),
                label("description"),
                SizedBox(height: 5.0),
                descriptionField,
                SizedBox(height: 20.0),
                auth.loggedInStatus == Status.Authenticating
                    ? loading
                    : longButtons("Login", doRegister),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
