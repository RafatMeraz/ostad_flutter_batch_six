import 'package:crafty_bay/data/models/slider_model.dart';

class SliderListModel {
  String? msg;
  List<SliderModel>? data;

  SliderListModel({this.msg, this.data});

  SliderListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <SliderModel>[];
      json['data'].forEach((v) {
        data!.add(new SliderModel.fromJson(v));
      });
    }
  }
}
