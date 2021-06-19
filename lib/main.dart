import 'package:flutter/material.dart';
import 'package:hemobile/pages/dashboard.dart';
import 'package:hemobile/pages/landing.dart';
import 'package:hemobile/pages/list.dart';
import 'package:hemobile/pages/login.dart';
import 'package:hemobile/pages/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.red,
        accentTextTheme: TextTheme(
          button: TextStyle(color: Colors.white),
        ),
      ),
      home: LandingPage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginPage(),
        '/dashboard': (BuildContext context) =>
            DashboardPage(title: 'Dashboard'),
        '/profile': (BuildContext context) => ProfilePage(title: 'Perfil'),
        '/list': (BuildContext context) => ListPage(title: 'Demandas'),
        '/history': (BuildContext context) => ListPage(title: 'Histórico'),
      },
    );
  }
}
