import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 900,
          child: Text(
            'Entrar',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 40,
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w300,
              fontFamily: 'Comfortaa',
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(hintText: 'jane@gmail.com'),
        ),
        SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(hintText: '*********'),
        ),
        SizedBox(height: 30),
        Container(
          width: 900,
          height: 50,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Theme.of(context).accentColor,
            ),
            onPressed: () {
              debugPrint('logar');
              Navigator.pushNamed(context, '/dashboard');
            },
            child: Text('ENTRAR'),
          ),
        ),
      ],
    );
  }
}
