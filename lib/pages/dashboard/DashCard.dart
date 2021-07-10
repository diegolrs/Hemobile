import 'package:flutter/material.dart';

enum DashCardType { Dark, Light }

class DashCard extends StatelessWidget {
  final DashCardType type;
  final String text;
  final IconData icon;
  final void Function()? onPressed;

  const DashCard(
      {Key? key,
      this.type = DashCardType.Dark,
      required this.text,
      required this.icon,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle _buttonStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.all<Color>(
        type == DashCardType.Dark
            ? Colors.white.withOpacity(0.2)
            : Theme.of(context).accentColor.withOpacity(0.2),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
          type == DashCardType.Dark
              ? Colors.white
              : Theme.of(context).accentColor),
      backgroundColor: MaterialStateProperty.all<Color>(
          type == DashCardType.Dark
              ? Theme.of(context).accentColor
              : Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(
            width: 3,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 5,
        top: 5,
      ),
      child: Container(
        width: 900,
        height: 150,
        child: ElevatedButton(
          style: _buttonStyle,
          onPressed: onPressed,
          child: Row(
            children: [
              Flexible(
                flex: 6,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: 5,
                ),
              ),
              Flexible(
                flex: 3,
                child: Icon(
                  icon,
                  size: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
