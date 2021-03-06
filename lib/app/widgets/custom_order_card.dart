import 'package:architeture/app/models/order_model.dart';
import 'package:architeture/app/modules/order/order_module.dart';
import 'package:architeture/app/modules/order/order_store.dart';
import 'package:architeture/app/modules/order/pages/order_history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'custom_raised_button.dart';

class CustomOrderCard extends StatefulWidget {
  final Order order;
  const CustomOrderCard({Key key, this.order}) : super(key: key);

  @override
  _CustomOrderCardState createState() => _CustomOrderCardState();
}

class _CustomOrderCardState extends State<CustomOrderCard> {
  TextEditingController observationTextController = TextEditingController();
  TextEditingController pauseOrderTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = Modular.get<OrderStore>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        height: !widget.order.paussed ? height * 0.20 : height * 0.26,
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                    child: Text(
                      widget.order.paussed ? "Pausado" : "Em atendimanto",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cliente: ",
                          ),
                          Text(
                            widget.order.cliente.nome,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "N??mero da Ordem de Servi??o: ",
                          ),
                          Text(
                            widget.order.id.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                  height: 2,
                  thickness: 1,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "Defeito:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        widget.order.iten.problem,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: SizedBox(
                          height: height * 0.05,
                          child: CustomRaisedButton(
                            text: "Finalizar Ordem",
                            color: Colors.green,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text(
                                          "Finalizar Ordem ${widget.order.id}"),
                                      content: Form(
                                        key: formKey,
                                        child: TextFormField(
                                          controller: observationTextController,
                                          validator: (text) {
                                            if (text.isEmpty) {
                                              return 'Campo n??o pode estar vazio';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Descreva uma observa????o da ordem"),
                                        ),
                                      ),
                                      actions: [
                                        CustomRaisedButton(
                                          color: Colors.green,
                                          onPressed: () {
                                            if (formKey.currentState
                                                .validate()) {
                                              controller
                                                  .closeOrder(
                                                      context,
                                                      widget.order.id,
                                                      observationTextController
                                                          .text)
                                                  .then((value) => controller
                                                      .getAllOrders());
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          text: "Finalizar",
                                        ),
                                        CustomRaisedButton(
                                          color: Colors.red,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          text: "Cancelar",
                                        ),
                                      ],
                                    );
                                  });
                            },
                          ),
                        ),
                      ),
                      widget.order.paussed
                          ? SizedBox(
                              height: height * 0.05,
                              child: CustomRaisedButton(
                                color: Colors.blue,
                                onPressed: () {
                                  controller
                                      .startOrder(context, widget.order.id)
                                      .then(
                                          (value) => controller.getAllOrders());
                                },
                                text: "Iniciar",
                              ),
                            )
                          : SizedBox(
                              height: height * 0.05,
                              child: CustomRaisedButton(
                                color: Colors.red,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          title: Text(
                                              "Pausar Ordem ${widget.order.id}"),
                                          content: Form(
                                            key: formKey,
                                            child: TextFormField(
                                              controller:
                                                  pauseOrderTextController,
                                              validator: (text) {
                                                if (text.isEmpty) {
                                                  return 'Campo n??o pode estar vazio';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "Descreva motivo da pausa"),
                                            ),
                                          ),
                                          actions: [
                                            CustomRaisedButton(
                                              color: Colors.green,
                                              onPressed: () {
                                                if (formKey.currentState
                                                    .validate()) {
                                                  controller
                                                      .pauseOrder(
                                                          context,
                                                          widget.order.id,
                                                          pauseOrderTextController
                                                              .text)
                                                      .then((value) =>
                                                          controller
                                                              .getAllOrders());
                                                  Navigator.of(context).pop();
                                                }
                                              },
                                              text: "Pausar",
                                            ),
                                            CustomRaisedButton(
                                              color: Colors.red,
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              text: "Cancelar",
                                            ),
                                          ],
                                        );
                                      });
                                },
                                text: "Pausar",
                              ),
                            ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Offstage(
                    offstage: !widget.order.paussed,
                    child: SizedBox(
                      height: height * 0.05,
                      child: CustomRaisedButton(
                        color: Colors.black,
                        onPressed: () {
                          Modular.to.pushNamed(
                              OrderModule.routeName +
                                  OrderHistoryPage.routeName,
                              arguments: {"orderId": widget.order.id});
                        },
                        text: "Checar Hist??rico",
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
