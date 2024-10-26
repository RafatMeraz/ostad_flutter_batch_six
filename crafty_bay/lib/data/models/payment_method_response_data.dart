import 'package:crafty_bay/data/models/payment_method.dart';

class PaymentMethodResponseData {
  List<PaymentMethod>? paymentMethod;
  int? payable;
  int? vat;
  int? total;

  PaymentMethodResponseData({this.paymentMethod, this.payable, this.vat, this.total});

  PaymentMethodResponseData.fromJson(Map<String, dynamic> json) {
    if (json['paymentMethod'] != null) {
      paymentMethod = <PaymentMethod>[];
      json['paymentMethod'].forEach((v) {
        paymentMethod!.add(PaymentMethod.fromJson(v));
      });
    }
    payable = json['payable'];
    vat = json['vat'];
    total = json['total'];
  }
}
