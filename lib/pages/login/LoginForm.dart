import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:localstorage/localstorage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormBuilderState>();
  final LocalStorage _userStorage = new LocalStorage('user_data');

  bool _loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _loginFormKey,
      child: Column(
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
          FormBuilderTextField(
            name: 'email',
            decoration: InputDecoration(hintText: 'jane@gmail.com'),
          ),
          SizedBox(height: 30),
          FormBuilderTextField(
            name: 'password',
            decoration: InputDecoration(hintText: '******'),
            obscureText: true,
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
              onPressed: () async {
                debugPrint('logar');

                _loginFormKey.currentState!.save();
                final formData = _loginFormKey.currentState!.value;
                print(formData);

                setState(() {
                  _loading = true;
                });
                await Dio()
                    .post(
                  'https://hemobile.herokuapp.com/users/login',
                  data: formData,
                )
                    .then(
                  (value) async {
                    print(value);
                    await _userStorage.setItem('user', value.data);
                    setState(() {
                      _loading = false;
                    });
                    Navigator.pushNamed(context, '/dashboard');
                  },
                ).onError(
                  (error, stackTrace) {
                    print("erro ne pai $error");
                    setState(() {
                      _loading = false;
                    });
                  },
                );
              },
              child: _loading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text('ENTRAR'),
            ),
          ),
        ],
      ),
    );
  }
}
