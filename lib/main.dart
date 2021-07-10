import 'package:flutter/material.dart';
import 'package:hemobile/configs/constants.dart';
import 'package:hemobile/models/user_model.dart';
import 'package:hemobile/pages/dashboard/dashboard.dart';
import 'package:hemobile/pages/history/history.dart';
import 'package:hemobile/pages/landing.dart';
import 'package:hemobile/pages/demands.dart';
import 'package:hemobile/pages/login/login.dart';
import 'package:hemobile/pages/profile/profile.dart';
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
        accentColor: kAccentColor,
        accentTextTheme: TextTheme(
          button: TextStyle(
            color: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: kAccentColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: kAccentColor),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(kAccentColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide(
                  width: 3,
                  color: kAccentColor,
                ),
              ),
            ),
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
        '/demands': (BuildContext context) => DemandsPage(title: 'Demandas'),
        '/history': (BuildContext context) => HistoryPage(title: 'Histórico'),
      },
    );
  }
}
