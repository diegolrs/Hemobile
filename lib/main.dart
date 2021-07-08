import 'package:flutter/material.dart';
import 'package:hemobile/models/user_model.dart';
import 'package:hemobile/pages/dashboard.dart';
import 'package:hemobile/pages/landing.dart';
import 'package:hemobile/pages/list.dart';
import 'package:hemobile/pages/login/login.dart';
import 'package:hemobile/pages/profile.dart';
import 'package:hemobile/repositories/user_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final UserRepository _userRepository = new UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Color.fromARGB(255, 144, 0, 0),
        accentTextTheme: TextTheme(
          button: TextStyle(
            color: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2.0, color: Color.fromARGB(255, 144, 0, 0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2.0, color: Color.fromARGB(255, 144, 0, 0)),
          ),
        ),
      ),
      home: FutureBuilder(
        future: _userRepository.fetchUser(),
        builder:
            (BuildContext context, AsyncSnapshot<UserModel> userLocalData) {
          if (userLocalData.hasData) return DashboardPage(title: 'dash');
          return LandingPage();
        },
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginPage(
              loginInputType: LoginInputType.Login,
            ),
        '/dashboard': (BuildContext context) =>
            DashboardPage(title: 'Dashboard'),
        '/profile': (BuildContext context) => ProfilePage(title: 'Perfil'),
        '/list': (BuildContext context) => ListPage(title: 'Demandas'),
        '/history': (BuildContext context) => ListPage(title: 'Histórico'),
      },
    );
  }
}
