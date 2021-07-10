import 'package:flutter/material.dart';
import 'package:hemobile/pages/dashboard/DashCard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required String title}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/profile',
              );
            },
            icon: Icon(Icons.person),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: SizedBox(
              width: 900,
              child: Text(
                'Olá usuário',
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
          Expanded(
            child: ListView(
              children: [
                DashCard(
                  text: 'CONSULTAR HEMOCENTROS PROXIMOS',
                  icon: Icons.map,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/hemocentros',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                DashCard(
                  text: 'LISTAR PRINCIPAIS DEMANDAS',
                  icon: Icons.list,
                  type: DashCardType.Light,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/demands',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                DashCard(
                  text: 'HISTÓRICO DE DOAÇÕES',
                  icon: Icons.map,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/history',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                DashCard(
                  text: 'CARTÃO DOADOR',
                  icon: Icons.card_membership,
                  type: DashCardType.Light,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/profile',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
