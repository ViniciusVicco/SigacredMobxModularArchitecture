// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderStore on _OrderStoreBase, Store {
  final _$listAllOrdersResponseAtom =
      Atom(name: '_OrderStoreBase.listAllOrdersResponse');

  @override
  StatusResponse<List<Order>> get listAllOrdersResponse {
    _$listAllOrdersResponseAtom.reportRead();
    return super.listAllOrdersResponse;
  }

  @override
  set listAllOrdersResponse(StatusResponse<List<Order>> value) {
    _$listAllOrdersResponseAtom.reportWrite(value, super.listAllOrdersResponse,
        () {
      super.listAllOrdersResponse = value;
    });
  }

  final _$newOrderResponseAtom = Atom(name: '_OrderStoreBase.newOrderResponse');

  @override
  StatusResponse<bool> get newOrderResponse {
    _$newOrderResponseAtom.reportRead();
    return super.newOrderResponse;
  }

  @override
  set newOrderResponse(StatusResponse<bool> value) {
    _$newOrderResponseAtom.reportWrite(value, super.newOrderResponse, () {
      super.newOrderResponse = value;
    });
  }

  final _$endOrderResponseAtom = Atom(name: '_OrderStoreBase.endOrderResponse');

  @override
  StatusResponse<bool> get endOrderResponse {
    _$endOrderResponseAtom.reportRead();
    return super.endOrderResponse;
  }

  @override
  set endOrderResponse(StatusResponse<bool> value) {
    _$endOrderResponseAtom.reportWrite(value, super.endOrderResponse, () {
      super.endOrderResponse = value;
    });
  }

  final _$getAllOrdersAsyncAction = AsyncAction('_OrderStoreBase.getAllOrders');

  @override
  Future<void> getAllOrders() {
    return _$getAllOrdersAsyncAction.run(() => super.getAllOrders());
  }

  final _$createNewOrderAsyncAction =
      AsyncAction('_OrderStoreBase.createNewOrder');

  @override
  Future<void> createNewOrder(BuildContext context) {
    return _$createNewOrderAsyncAction.run(() => super.createNewOrder(context));
  }

  final _$closeOrderAsyncAction = AsyncAction('_OrderStoreBase.closeOrder');

  @override
  Future<void> closeOrder(BuildContext context, int orderId, String obsOrdem) {
    return _$closeOrderAsyncAction
        .run(() => super.closeOrder(context, orderId, obsOrdem));
  }

  @override
  String toString() {
    return '''
listAllOrdersResponse: ${listAllOrdersResponse},
newOrderResponse: ${newOrderResponse},
endOrderResponse: ${endOrderResponse}
    ''';
  }
}
