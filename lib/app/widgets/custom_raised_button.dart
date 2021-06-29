import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final Color color;
  CustomRaisedButton(
      {this.child, @required this.onPressed, @required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
    );
  }
}
