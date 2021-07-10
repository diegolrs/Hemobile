import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final String route;
  final IconData icon;

  const ProfileButton({
    Key? key,
    required this.text,
    required this.route,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Icon(icon),
              Text(text),
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
