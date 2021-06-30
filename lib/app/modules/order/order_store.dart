import 'package:architeture/app/commom/status_response.dart';
import 'package:architeture/app/models/order_history.dart';
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
      newOrderResponse = StatusResponse.completed(true);
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
      endOrderResponse = StatusResponse.completed(true);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Ordem finalizada"),
        backgroundColor: Theme.of(context).accentColor,
      ));
    } catch (error) {
      endOrderResponse = StatusResponse.error("Ocorreu um erro ao finalizar");
    }
  }

  @observable
  StatusResponse<bool> startOrderResponse = StatusResponse();

  @action
  Future<void> startOrder(BuildContext context, int orderId) async {
    startOrderResponse = StatusResponse.loading();
    try {
      await _orderRepository.startOrder(orderId);
      startOrderResponse = StatusResponse.completed(true);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Ordem $orderId iniciada"),
        backgroundColor: Theme.of(context).accentColor,
      ));
    } catch (error) {
      startOrderResponse =
          StatusResponse.error("Ocorreu um erro ao iniciar o serviço");
    }
  }

  @observable
  StatusResponse<bool> pauseOrderResponse = StatusResponse();

  @action
  Future<void> pauseOrder(
      BuildContext context, int orderId, String motion) async {
    pauseOrderResponse = StatusResponse.loading();
    try {
      await _orderRepository.pauseOrder(orderId, motion);
      pauseOrderResponse = StatusResponse.completed(true);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Ordem $orderId pausada"),
        backgroundColor: Theme.of(context).accentColor,
      ));
    } catch (error) {
      pauseOrderResponse =
          StatusResponse.error("Ocorreu um erro ao pausar o serviço");
    }
  }

  @observable
  StatusResponse<List<OrderHistory>> orderHistoryListAppResponse =
      StatusResponse();

  @action
  Future<void> getOrderHistory(int orderId) async {
    orderHistoryListAppResponse = StatusResponse.loading();
    try {
      List<OrderHistory> orderHistoryList =
          await _orderRepository.getOrderHistory(orderId);
      orderHistoryListAppResponse = StatusResponse.completed(orderHistoryList);
    } catch (error) {
      orderHistoryListAppResponse =
          StatusResponse.error("Ocorreu um erro ao buscar histórico");
    }
  }
}
