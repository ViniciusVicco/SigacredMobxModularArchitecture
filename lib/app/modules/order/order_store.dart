import 'package:architeture/app/commom/status_response.dart';
import 'package:architeture/app/models/order_model.dart';
import 'package:architeture/app/modules/order/order_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {
  @observable
  StatusResponse<List<Order>> listAllOrdersResponse = StatusResponse();

  OrderRepository _orderRepository = OrderRepository();

  List<Order> listOfValidOrders = [];

  int clientId = 1;

  @action
  Future<void> getAllOrders() async {
    listAllOrdersResponse = StatusResponse.loading();
    try {
      List<Order> data = await _orderRepository.getAllOrders();
      listOfValidOrders = [];
      data.forEach((element) {
        if (element.dateClosed == null) {
          listOfValidOrders.add(element);
        }
      });
      listAllOrdersResponse = StatusResponse.completed(listOfValidOrders);
    } catch (error) {
      listAllOrdersResponse = StatusResponse.error(error);
    }
  }

  @observable
  StatusResponse<bool> newOrderResponse = StatusResponse();

  @action
  Future<void> createNewOrder(BuildContext context) async {
    newOrderResponse = StatusResponse.loading();
    try {
      await _orderRepository.createNewOrder(clientId);
      newOrderResponse = StatusResponse.completed(null);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Nova ordem solicitada com sucesso"),
        backgroundColor: Theme.of(context).accentColor,
      ));
    } catch (error) {
      newOrderResponse = StatusResponse.error("Ocorreu um erro");
    }
  }

  @observable
  StatusResponse<bool> endOrderResponse = StatusResponse();

  @action
  Future<void> closeOrder(
      BuildContext context, int orderId, String obsOrdem) async {
    endOrderResponse = StatusResponse.loading();
    try {
      await _orderRepository.closeOrder(orderId, obsOrdem);
      endOrderResponse = StatusResponse.completed(null);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Ordem finalizada"),
        backgroundColor: Theme.of(context).accentColor,
      ));
    } catch (error) {
      endOrderResponse = StatusResponse.error("Ocorreu um erro ao finalizar");
    }
  }
}
