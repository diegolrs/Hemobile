import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hemobile/models/donation_model.dart';
import 'package:hemobile/models/user_model.dart';
import 'package:localstorage/localstorage.dart';

class SchedulesPage extends StatefulWidget {
  const SchedulesPage({Key? key}) : super(key: key);

  @override
  _SchedulesPageState createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  final LocalStorage _userStorage = new LocalStorage('user_data');

  late DonationModel donation;

  bool _loading = true;
  bool _error = false;

  _initAsync() async {
    final userStorage = await _userStorage.getItem('user');
    // user = UserModel.fromJson(userStorage);
    print(userStorage);

    await Dio()
        .get(
            'https://hemobile.herokuapp.com/donations/appointments/${userStorage['uuid']}')
        .then((value) => setState(() {
              donation = DonationModel.fromJson(value.data);
              _loading = false;
            }))
        .onError((error, stackTrace) => setState(() {
              donation = new DonationModel('', '', '', '');
              _error = true;
              _loading = false;
            }));
  }

  @override
  void initState() {
    _initAsync();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: SizedBox(
              width: 900,
              child: Text(
                'Agendamentos',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Comfortaa',
                ),
              ),
            ),
          ),
          _loading
              ? CircularProgressIndicator(
                  color: Theme.of(context).accentColor,
                )
              : Column(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 100,
                      color: Theme.of(context).accentColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).accentColor,
                            fontFamily: 'Comfortaa',
                          ),
                          children: _error
                              ? [
                                  TextSpan(
                                      text: 'Voce nao tem agendamento marcado'),
                                ]
                              : [
                                  TextSpan(text: 'Você tem até '),
                                  TextSpan(
                                    text: '3',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  TextSpan(
                                      text:
                                          ' dias para realizar a doação no ${donation.bloodCenterName}'),
                                ],
                        ),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
