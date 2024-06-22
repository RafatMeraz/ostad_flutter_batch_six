import 'package:task_manager/data/models/user_model.dart';

class LoginModel {
  String? status;
  String? token;
  UserModel? userModel;

  LoginModel({this.status, this.token, this.userModel});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    userModel = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    if (userModel != null) {
      data['data'] = userModel!.toJson();
    }
    return data;
  }
}
