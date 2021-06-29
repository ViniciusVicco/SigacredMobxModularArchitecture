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
  @action
  Future<void> getAllOrders() async {
    listAllOrdersResponse = StatusResponse.loading();
    try {
      List<Order> data = await _orderRepository.getAllOrders();
      listAllOrdersResponse = StatusResponse.completed(data);
    } catch (error) {
      StatusResponse.error(error);
    }
  }
}
