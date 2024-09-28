import 'package:crafty_bay/data/models/slider_model.dart';

class SliderListModel {
  String? msg;
  List<SliderModel>? sliderList;

  SliderListModel({this.msg, this.sliderList});

  SliderListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderList = <SliderModel>[];
      json['data'].forEach((v) {
        sliderList!.add(SliderModel.fromJson(v));
      });
    }
  }
}
