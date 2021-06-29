import 'package:architeture/app/modules/order/order_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PendingOrdersPage extends StatefulWidget {
  const PendingOrdersPage({Key key}) : super(key: key);

  @override
  _PendingOrdersPageState createState() => _PendingOrdersPageState();
}

class _PendingOrdersPageState extends State<PendingOrdersPage> {
  final controller = Modular.get<OrderStore>();
  @override
  void initState() {
    super.initState();
    controller.getAllOrders();
    print("roiieee");
  }

  @override
  Widget build(BuildContext context) {
    print("navegou");
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Ordens pendentes"),
        ),
      ),
    );
  }
}
