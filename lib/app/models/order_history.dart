import 'order_model.dart';

class OrderHistory {
  int id;
  Order ordem;
  String motion;

  OrderHistory({this.id, this.ordem, this.motion});

  OrderHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ordem = json['ordem'] != null ? new Order.fromJson(json['ordem']) : null;
    motion = json['motion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.ordem != null) {
      data['ordem'] = this.ordem.toJson();
    }
    data['motion'] = this.motion;
    return data;
  }
}
