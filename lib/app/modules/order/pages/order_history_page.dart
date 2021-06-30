import 'package:architeture/app/modules/order/order_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderHistoryPage extends StatefulWidget {
  static const String routeName = '/OrderHistoryPage';
  final int orderId;
  const OrderHistoryPage({Key key, this.orderId}) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final controller = Modular.get<OrderStore>();

  @override
  void initState() {
    super.initState();
    controller.getOrderHistory(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.orderId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Histório Ordem ${widget.orderId}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Observer(builder: (_) {
        if (controller.orderHistoryListAppResponse.isLoading)
          return Center(child: CircularProgressIndicator());
        if (controller.orderHistoryListAppResponse.isCompleted &&
            controller.orderHistoryListAppResponse.body.isEmpty)
          return Center(
            child: Text("Não há nenhum histórico lançado para esta ordem"),
          );
        if (controller.orderHistoryListAppResponse.isCompleted &&
            controller.orderHistoryListAppResponse.body.isNotEmpty)
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ListView.builder(
                itemCount: controller.orderHistoryListAppResponse.body.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Justificativa:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width,
                              child: Text(controller.orderHistoryListAppResponse
                                  .body[index].motion),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        if (controller.orderHistoryListAppResponse.hasError) {
          return Center(child: Text("Ocorreu um problema"));
        }
        return Container();
      }),
    );
  }
}
