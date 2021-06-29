import 'package:architeture/app/modules/order/order_store.dart';
import 'package:architeture/app/widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RequestOrderPage extends StatefulWidget {
  static const String routeName = "/RequestOrderPage";
  const RequestOrderPage({Key key}) : super(key: key);

  @override
  _RequestOrderPageState createState() => _RequestOrderPageState();
}

class _RequestOrderPageState extends State<RequestOrderPage> {
  final controller = Modular.get<OrderStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nova Solicitação",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Observer(builder: (_) {
          if (controller.newOrderResponse.isLoading) {
            return CircularProgressIndicator();
          }
          if (controller.newOrderResponse.hasError) {
            return Text("Ocorreu um erro");
          }
          return CustomRaisedButton(
            color: Theme.of(context).accentColor,
            onPressed: () {
              controller.createNewOrder();
            },
            text: "Solicitar Nova Ordem De Serviço",
          );
        }),
      ),
    );
  }
}
