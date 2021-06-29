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

  Future<void> createNewOrder() async {
    final String endPoint = "/v1/ordens/create";
    final Map<String, dynamic> body = {
      "idCliente": 1,
      "idItem": 2,
      "dateOrdem": DateTime.now().toIso8601String()
    };
    final String path = baseUrl + endPoint;
    final response = await dio.post(path, queryParameters: body);
  }
}
