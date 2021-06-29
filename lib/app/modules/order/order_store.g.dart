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

  final _$getAllOrdersAsyncAction = AsyncAction('_OrderStoreBase.getAllOrders');

  @override
  Future<void> getAllOrders() {
    return _$getAllOrdersAsyncAction.run(() => super.getAllOrders());
  }

  @override
  String toString() {
    return '''
listAllOrdersResponse: ${listAllOrdersResponse}
    ''';
  }
}
