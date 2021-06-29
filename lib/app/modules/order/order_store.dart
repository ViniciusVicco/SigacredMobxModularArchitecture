import 'package:architeture/app/commom/status_response.dart';
import 'package:architeture/app/models/order_model.dart';
import 'package:architeture/app/modules/order/order_repository.dart';
import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {
  @observable
  StatusResponse<List<Order>> listAllOrdersResponse = StatusResponse();

  OrderRepository _orderRepository = OrderRepository();

  List<Order> listOfValidOrders = [];

  @action
  Future<void> getAllOrders() async {
    listAllOrdersResponse = StatusResponse.loading();
    try {
      List<Order> data = await _orderRepository.getAllOrders();
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
  Future<void> createNewOrder() async {
    newOrderResponse = StatusResponse.loading();
    try {
      await _orderRepository.createNewOrder();
      newOrderResponse = StatusResponse.completed(null);
    } catch (error) {
      newOrderResponse = StatusResponse.error(error);
    }
  }
}
