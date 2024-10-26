import 'package:crafty_bay/data/models/payment_method_response_data.dart';

class PaymentMethodModel {
  String? msg;
  List<PaymentMethodResponseData>? data;

  PaymentMethodModel({this.msg, this.data});

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <PaymentMethodResponseData>[];
      json['data'].forEach((v) {
        data!.add(PaymentMethodResponseData.fromJson(v));
      });
    }
  }
}
