import 'package:flutter/material.dart';

class DemandsPage extends StatefulWidget {
  const DemandsPage({Key? key, required String title}) : super(key: key);

  @override
  _DemandsPageState createState() => _DemandsPageState();
}

class _DemandsPageState extends State<DemandsPage> {
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
          DemandsHeader(),
          Expanded(
            child: ListView(
              children: [
                HemocentroTile(
                  name: 'Hemocentro Cabedelo',
                  description: 'Joaquim Junior precisa de sangue',
                ),
                HemocentroTile(
                  name: 'Hemocentro Bayeux',
                  description: '5/25 - A, B, O',
                ),
                HemocentroTile(
                  name: 'Hemocentro João Pessoa',
                  description: '19/22 - A, O',
                ),
                HemocentroTile(
                  name: 'Hemocentro Santa Rita',
                  description: 'Evento do Hemocentro de Santa Rita',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HemocentroTile extends StatelessWidget {
  final String name;
  final String description;

  const HemocentroTile({
    Key? key,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.location_city),
      title: Text(name),
      subtitle: Text(description),
    );
  }
}

class DemandsHeader extends StatelessWidget {
  const DemandsHeader({
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
            Icons.bloodtype,
            size: 70,
            color: Theme.of(context).accentColor,
          ),
          Expanded(
            child: Text(
              'Principais demandas',
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
