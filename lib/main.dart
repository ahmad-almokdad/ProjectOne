import 'package:flutter/material.dart';
import 'package:ProjectOne/pages/welcome_company.dart';
import 'pages/dashboard.dart';
import 'pages/login_user.dart';
import 'pages/register_user.dart';
import 'pages/welcome_user.dart';
import 'providers/auth.dart';
import 'providers/user_provider.dart';
import 'util/shared_preference.dart';
import 'package:provider/provider.dart';

import 'domain/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<List<String>> getUserData() => UserPreferences().getUser();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
                List<String>infoUser = snapshot.data ?? [] ;
                /**
                 * info[0] for user is user or company;
                 * info[1] for token;
                 */
                print(infoUser);
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else if (infoUser[1] == null)
                      return LoginUser();
                    else if(infoUser[0] =='user')
                      return WelcomeUser();
                    else if (infoUser[0]=='company')
                      return WelcomeCompany();


                    return WelcomeUser();
                }
              }),
          routes: {
            '/dashboard': (context) => DashBoard(),
            '/login': (context) => LoginUser(),
            '/register': (context) => RegisterUser(),
          }),
    );
  }
}
