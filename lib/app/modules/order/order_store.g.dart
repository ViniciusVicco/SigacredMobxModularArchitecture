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

  final _$startOrderResponseAtom =
      Atom(name: '_OrderStoreBase.startOrderResponse');

  @override
  StatusResponse<bool> get startOrderResponse {
    _$startOrderResponseAtom.reportRead();
    return super.startOrderResponse;
  }

  @override
  set startOrderResponse(StatusResponse<bool> value) {
    _$startOrderResponseAtom.reportWrite(value, super.startOrderResponse, () {
      super.startOrderResponse = value;
    });
  }

  final _$pauseOrderResponseAtom =
      Atom(name: '_OrderStoreBase.pauseOrderResponse');

  @override
  StatusResponse<bool> get pauseOrderResponse {
    _$pauseOrderResponseAtom.reportRead();
    return super.pauseOrderResponse;
  }

  @override
  set pauseOrderResponse(StatusResponse<bool> value) {
    _$pauseOrderResponseAtom.reportWrite(value, super.pauseOrderResponse, () {
      super.pauseOrderResponse = value;
    });
  }

  final _$orderHistoryListAppResponseAtom =
      Atom(name: '_OrderStoreBase.orderHistoryListAppResponse');

  @override
  StatusResponse<List<OrderHistory>> get orderHistoryListAppResponse {
    _$orderHistoryListAppResponseAtom.reportRead();
    return super.orderHistoryListAppResponse;
  }

  @override
  set orderHistoryListAppResponse(StatusResponse<List<OrderHistory>> value) {
    _$orderHistoryListAppResponseAtom
        .reportWrite(value, super.orderHistoryListAppResponse, () {
      super.orderHistoryListAppResponse = value;
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

  final _$startOrderAsyncAction = AsyncAction('_OrderStoreBase.startOrder');

  @override
  Future<void> startOrder(BuildContext context, int orderId) {
    return _$startOrderAsyncAction
        .run(() => super.startOrder(context, orderId));
  }

  final _$pauseOrderAsyncAction = AsyncAction('_OrderStoreBase.pauseOrder');

  @override
  Future<void> pauseOrder(BuildContext context, int orderId, String motion) {
    return _$pauseOrderAsyncAction
        .run(() => super.pauseOrder(context, orderId, motion));
  }

  final _$getOrderHistoryAsyncAction =
      AsyncAction('_OrderStoreBase.getOrderHistory');

  @override
  Future<void> getOrderHistory(int orderId) {
    return _$getOrderHistoryAsyncAction
        .run(() => super.getOrderHistory(orderId));
  }

  @override
  String toString() {
    return '''
listAllOrdersResponse: ${listAllOrdersResponse},
newOrderResponse: ${newOrderResponse},
endOrderResponse: ${endOrderResponse},
startOrderResponse: ${startOrderResponse},
pauseOrderResponse: ${pauseOrderResponse},
orderHistoryListAppResponse: ${orderHistoryListAppResponse}
    ''';
  }
}
