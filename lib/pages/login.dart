import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            splashRadius: 20,
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
