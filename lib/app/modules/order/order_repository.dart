import 'package:architeture/app/models/order_history.dart';
import 'package:architeture/app/models/order_model.dart';
import 'package:dio/dio.dart';

class OrderRepository {
  final String baseUrl = "https://desafio.sigacred.com.br";
  Dio dio = new Dio();

  Future<List<Order>> getAllOrders() async {
    final String endPoint = "/v1/ordens";
    final String path = baseUrl + endPoint;
    final response = await dio.get(path);
    return (response.data as List).map((order) {
      return Order.fromJson(order);
    }).toList();
  }

  Future<void> createNewOrder(int clientId) async {
    final String endPoint = "/v1/ordens/create";
    final Map<String, dynamic> body = {
      "idClient": clientId,
      "idItem": 2,
      "dateOrdem": DateTime.now().toIso8601String()
    };
    final String path = baseUrl + endPoint;
    await dio.post(path, data: body);
  }

  Future<void> closeOrder(int orderId, String obsOrdem) async {
    final String endPoint = "/v1/ordens/closeOrdem";
    final String path = baseUrl + endPoint;
    final Map<String, dynamic> body = {"id": orderId, "obsOrdem": obsOrdem};
    await dio.post(path, data: body);
  }

  Future<void> startOrder(int orderId) async {
    final String endPoint = "/v1/ordens/startOrdem";
    final String path = baseUrl + endPoint;
    final Map<String, dynamic> body = {
      "datestart": DateTime.now().toIso8601String(),
      "id": orderId
    };
    await dio.post(path, data: body);
  }

  Future<void> pauseOrder(int orderId, String motion) async {
    final String endPoint = "/v1/ordens/pauseOrdem";
    final String path = baseUrl + endPoint;
    final Map<String, dynamic> body = {"id": orderId, "motion": motion};
    await dio.post(path, data: body);
  }

  Future<List<OrderHistory>> getOrderHistory(int orderId) async {
    final String endPoint = "/v1/ordens/ordemhistory/$orderId";
    final String path = baseUrl + endPoint;
    final response = await dio.get(path);
    return (response.data as List).map((orderHistory) {
      return OrderHistory.fromJson(orderHistory);
    }).toList();
  }
}
