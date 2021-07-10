import 'package:flutter/material.dart';
import 'package:hemobile/pages/profile/ProfileBottomRow.dart';
import 'package:hemobile/pages/profile/ProfileCard.dart';
import 'package:hemobile/pages/profile/ProfileData.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required String title}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Column(
          children: [
            ProfileCard(),
            SizedBox(height: 30),
            ProfileData(),
            SizedBox(height: 30),
            ProfileBottomRow(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
