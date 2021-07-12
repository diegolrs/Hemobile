import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:localstorage/localstorage.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _registerFormKey = GlobalKey<FormBuilderState>();
  final LocalStorage _userStorage = new LocalStorage('user_data');

  bool _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _registerFormKey,
      child: ListView(
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
              'Nome:',
              textAlign: TextAlign.start,
            ),
          ),
          FormBuilderTextField(
            name: 'name',
            decoration: InputDecoration(hintText: 'Jane Do'),
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
          FormBuilderTextField(
            name: 'email',
            decoration: InputDecoration(hintText: 'example@email.com'),
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
          FormBuilderTextField(
            name: 'password',
            decoration: InputDecoration(hintText: '*********'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 900,
            height: 20,
            child: Text(
              'Tipo sanguineo:',
              textAlign: TextAlign.start,
            ),
          ),
          FormBuilderTextField(
            name: 'bloodType',
            decoration: InputDecoration(hintText: 'A+'),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 900,
            height: 20,
            child: Text(
              'Naturalidade:',
              textAlign: TextAlign.start,
            ),
          ),
          FormBuilderTextField(
            name: 'narutality',
            decoration: InputDecoration(hintText: 'Brasileiro'),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 900,
            height: 20,
            child: Text(
              'CPF:',
              textAlign: TextAlign.start,
            ),
          ),
          FormBuilderTextField(
            name: 'cpf',
            decoration: InputDecoration(hintText: '111.111.111-11'),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 900,
            height: 20,
            child: Text(
              'Numero de doador:',
              textAlign: TextAlign.start,
            ),
          ),
          FormBuilderTextField(
            name: 'donorNumber',
            decoration: InputDecoration(hintText: '31232131232'),
          ),
          SizedBox(height: 20),
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

                _registerFormKey.currentState!.save();
                final formData = _registerFormKey.currentState!.value;
                print(formData);

                setState(() {
                  _loading = true;
                });
                await Dio()
                    .post(
                  'https://hemobile.herokuapp.com/users',
                  data: formData,
                )
                    .then(
                  (value) async {
                    print(value);
                    // await _userStorage.setItem('user', value.data);
                    setState(() {
                      _loading = false;
                    });
                  },
                ).onError(
                  (error, stackTrace) {
                    print("erro ne pai ${error}");
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
                  : Text('CADASTRAR'),
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: 900,
            height: 100,
            child: Text(
                "Ao se cadastrar, você concorda com os termos de uso e a política de privacidade da empresa LinQ e do aplicativo Hemobile®."),
          ),
        ],
      ),
    );
  }
}
