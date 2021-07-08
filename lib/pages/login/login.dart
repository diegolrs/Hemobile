import 'package:flutter/material.dart';
import 'package:hemobile/pages/login/LoginForm.dart';
import 'package:hemobile/pages/login/RegisterForm.dart';

enum LoginInputType { Login, Register }

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required loginInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as LoginInputType;
    print(arg);

    Widget formWidget =
        arg == LoginInputType.Register ? RegisterForm() : LoginForm();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: formWidget,
      ),
    );
  }
}
