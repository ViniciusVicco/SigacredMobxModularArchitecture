import 'package:architeture/app/models/order_model.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;

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
}
