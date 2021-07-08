import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 900,
          child: Text(
            'Cadastre-se',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 40,
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w300,
              fontFamily: 'Comfortaa',
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 900,
          height: 20,
          child: Text(
            'Email:',
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          decoration: InputDecoration(hintText: 'jane@gmail.com'),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 900,
          height: 20,
          child: Text(
            'Senha:',
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          decoration: InputDecoration(hintText: '*********'),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 900,
          height: 20,
          child: Text(
            'Confirmar senha:',
            textAlign: TextAlign.start,
          ),
        ),
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
              debugPrint('cadastrar');
              Navigator.pushNamed(context, '/dashboard');
            },
            child: Text('CONFIRMAR'),
          ),
        ),
        SizedBox(height: 30),
        Expanded(
          child: Container(
            width: 900,
            height: 100,
            child: Text(
                "Ao se cadastrar, você concorda com os termos de uso e a política de privacidade da empresa LinQ e do aplicativo Hemobile®."),
          ),
        ),
      ],
    );
  }
}
