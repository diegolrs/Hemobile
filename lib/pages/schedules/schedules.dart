import 'package:flutter/material.dart';

class SchedulesPage extends StatelessWidget {
  const SchedulesPage({Key? key}) : super(key: key);

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
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).accentColor,
                fontFamily: 'Comfortaa',
              ),
              children: [
                TextSpan(
                  text: '24',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                TextSpan(text: ' de setembro'),
              ],
            ),
          ),
          Icon(
            Icons.calendar_today,
            size: 100,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
