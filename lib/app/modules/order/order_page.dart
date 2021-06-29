import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  static const String routeName = '/OrderPage';
  final String title;
  const OrderPage({Key key, this.title = 'OrderPage'}) : super(key: key);
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
