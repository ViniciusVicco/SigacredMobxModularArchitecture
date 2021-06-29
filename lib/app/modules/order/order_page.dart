import 'package:architeture/app/modules/order/order_store.dart';
import 'package:architeture/app/widgets/custom_raised_button.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Todas Ordens",
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      height: height * 0.20,
                      child: Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Cliente: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(controller.listAllOrdersResponse
                                            .body[index].cliente.nome),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 50),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Cliente: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(controller
                                                  .listAllOrdersResponse
                                                  .body[index]
                                                  .cliente
                                                  .nome),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomRaisedButton(
                                      color: Colors.red,
                                      onPressed: () {},
                                      text: "Encerrar",
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });

          return Container();
        }));
  }
}
