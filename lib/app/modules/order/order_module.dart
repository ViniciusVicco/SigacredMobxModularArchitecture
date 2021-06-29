import 'package:architeture/app/modules/order/order_page.dart';
import 'package:architeture/app/modules/order/order_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderModule extends Module {
  static const String routeName = '/OrderModule';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OrderStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => OrderPage()),
  ];
}
