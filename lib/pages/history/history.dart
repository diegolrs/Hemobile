import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key, required String title}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
          DonationText(
            date: '19/07/2018',
          ),
          DonationText(
            date: '23/02/2019',
          ),
          DonationText(
            date: '18/11/2020',
          ),
          DonationText(
            date: '19/04/2021',
          ),
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
      height: 200,
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
