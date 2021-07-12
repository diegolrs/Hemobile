import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hemobile/models/donation_model.dart';
import 'package:hemobile/models/user_model.dart';
import 'package:localstorage/localstorage.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key, required String title}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final LocalStorage _userStorage = new LocalStorage('user_data');

  List<DonationModel> donationsList = [];
  bool _loading = true;

  _doAsync() async {
    final userStorage = await _userStorage.getItem('user');
    UserModel user = UserModel.fromJson(userStorage);

    final response = await Dio()
        .get('https://hemobile.herokuapp.com/donations/history/${user.uuid}');

    print(response.data);

    setState(() {
      donationsList = (response.data as List)
          .map((x) => DonationModel.fromJson(x))
          .toList();

      _loading = false;
    });
  }

  @override
  initState() {
    _doAsync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          HistoryHeader(),
          _loading
              ? CircularProgressIndicator(
                  color: Theme.of(context).accentColor,
                )
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final donation = donationsList[index];

                      return ListTile(
                        leading: Icon(
                          Icons.bloodtype,
                          color: Theme.of(context).accentColor,
                        ),
                        title: Text(donation.bloodCenterName),
                        subtitle: Text(donation.date),
                        trailing: Icon(
                          Icons.beenhere,
                          color: Colors.green,
                        ),
                      );
                    },
                    itemCount: donationsList.length,
                  ),
                )
        ],
      ),
    );
  }
}

class DonationText extends StatelessWidget {
  final String date;

  const DonationText({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 20,
          ),
          children: [
            TextSpan(
              text: 'Doação recebida: ',
            ),
            TextSpan(
              text: date,
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryHeader extends StatelessWidget {
  const HistoryHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      height: 150,
      child: Column(
        children: [
          Icon(
            Icons.list_alt,
            size: 70,
            color: Theme.of(context).accentColor,
          ),
          Expanded(
            child: Text(
              'Histórico de doações',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
