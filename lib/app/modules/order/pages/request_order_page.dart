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
  String dropdownValue = 'Monty';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nova Solicitação",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Selecione um cliente:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Icon(Icons.person),
                  ),
                  iconSize: 18,
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      if (newValue == "Monty") {
                        controller.clientId = 1;
                      } else {
                        controller.clientId = 3;
                      }
                    });
                  },
                  items: <String>['Monty', 'Danna']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: Center(
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
                    controller.createNewOrder(context);
                  },
                  text: "Solicitar Nova Ordem De Serviço",
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
