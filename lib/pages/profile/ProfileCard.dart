import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  100,
                ),
              ),
            ),
            child: Icon(
              Icons.person,
              size: 80,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Nome do usuário',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontFamily: 'Comfortaa'),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
