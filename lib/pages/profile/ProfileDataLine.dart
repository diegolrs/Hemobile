import 'package:flutter/material.dart';

class ProfileDataLine extends StatelessWidget {
  const ProfileDataLine({
    Key? key,
    required this.label,
    required this.data,
  }) : super(key: key);

  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 20,
          color: Theme.of(context).accentColor,
        ),
        children: [
          TextSpan(text: label),
          TextSpan(
            text: data,
            style: TextStyle(
              color: Theme.of(context).accentColor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
