import 'package:architeture/app/modules/order/order_store.dart';
import 'package:architeture/app/widgets/custom_order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderPage extends StatefulWidget {
  static const String routeName = '/OrderPage';
  const OrderPage({Key key}) : super(key: key);
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends ModularState<OrderPage, OrderStore> {
  @override
  void initState() {
    super.initState();
    controller.getAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Todas Ordens Pendentes",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Observer(builder: (context) {
          if (controller.listAllOrdersResponse.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.listAllOrdersResponse.hasError) {
            Center(child: Text("Ocorreu um erro"));
          }
          if (controller.listAllOrdersResponse.isCompleted)
            return ListView.builder(
                itemCount: controller.listAllOrdersResponse.body.length,
                itemBuilder: (context, index) {
                  return CustomOrderCard(
                    order: controller.listAllOrdersResponse.body[index],
                  );
                });

          return Container();
        }));
  }
}
