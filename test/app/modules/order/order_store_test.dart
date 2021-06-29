import 'package:flutter_test/flutter_test.dart';
import 'package:architeture/app/modules/order/order_store.dart';

void main() {
  OrderStore store;

  setUpAll(() {
    store = OrderStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
