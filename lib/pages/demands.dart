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
          'Demandas',
        ),
      ),
    );
  }
}
