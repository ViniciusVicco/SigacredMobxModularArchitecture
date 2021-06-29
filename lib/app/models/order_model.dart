import 'package:architeture/app/models/client_model.dart';

import 'item_model.dart';

class Order {
  int id;
  Client cliente;
  Item iten;
  String dateOrdem;
  String dateStart;
  String dateClosed;
  String obsOrdem;
  bool paussed;

  Order(
      {this.id,
      this.cliente,
      this.iten,
      this.dateOrdem,
      this.dateStart,
      this.dateClosed,
      this.obsOrdem,
      this.paussed});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cliente =
        json['cliente'] != null ? new Client.fromJson(json['cliente']) : null;
    iten = json['iten'] != null ? new Item.fromJson(json['iten']) : null;
    if (json['dateOrdem'] == null) {
      json['dateOrdem'] = null;
    } else {
      dateOrdem = json['dateOrdem'] is String
          ? json['dateOrdem']
          : json['dateOrdem'].toString();
    }
    if (json['dateStart'] == null) {
      dateStart = null;
    } else {
      dateStart = json['dateStart'] is String
          ? json['dateStart']
          : json['dateStart'].toString();
    }
    if (json['dateClosed'] == null) {
      dateStart = null;
    } else {
      dateStart = json['dateClosed'] is String
          ? json['dateClosed']
          : json['dateClosed'].toString();
    }
    obsOrdem = json['obsOrdem'];
    paussed = json['paussed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cliente != null) {
      data['cliente'] = this.cliente.toJson();
    }
    if (this.iten != null) {
      data['iten'] = this.iten.toJson();
    }
    data['dateOrdem'] = this.dateOrdem;
    data['dateStart'] = this.dateStart;
    data['dateClosed'] = this.dateClosed;
    data['obsOrdem'] = this.obsOrdem;
    data['paussed'] = this.paussed;
    return data;
  }
}
