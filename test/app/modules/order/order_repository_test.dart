import 'package:flutter_test/flutter_test.dart';
import 'package:architeture/app/modules/order/order_repository.dart';

void main() {
  OrderRepository repository;

  setUpAll(() {
    repository = OrderRepository();
  });
}
