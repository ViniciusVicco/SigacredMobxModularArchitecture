import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  CustomRaisedButton(
      {this.text, @required this.onPressed, @required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
    );
  }
}
