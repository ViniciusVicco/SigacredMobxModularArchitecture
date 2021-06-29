import 'package:architeture/app/modules/order/order_module.dart';
import 'package:architeture/app/widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Center(
              child: Text(
            "Bem vindo",
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: height / 8,
                  width: width,
                  child: ClipPath(
                    child: Container(
                      child: Center(
                          child: Text(
                        "Selecione uma das opções abaixo",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                      height: height,
                      color: Theme.of(context).primaryColor,
                    ),
                    clipper: OvalBottomBorderClipper(),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            height: height * 0.1,
                            width: width * 0.9,
                            child: CustomRaisedButton(
                              onPressed: () {
                                Modular.to.pushNamed(OrderModule.routeName);
                              },
                              color: Theme.of(context).accentColor,
                              text: "Ver Ordens Pendentes",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            height: height * 0.1,
                            width: width * 0.9,
                            child: CustomRaisedButton(
                              onPressed: () {},
                              color: Theme.of(context).accentColor,
                              text: "Solicitar Ordem",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
