import 'dart:convert';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/email_verification_screen.dart';
import 'package:get/get.dart' as getx;
import 'package:logger/logger.dart';

import 'package:crafty_bay/data/models/network_response.dart';
import 'package:http/http.dart';
import 'package:logger/web.dart';

class NetworkCaller {
  final Logger logger;
  final AuthController authController;

  NetworkCaller({required this.logger, required this.authController});

  Future<NetworkResponse> getRequest({required String url, String? token}) async {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url, {}, {}, '');
      final Response response = await get(uri, headers: {
        'token': '${token ?? AuthController.accessToken}',
      });
      if (response.statusCode == 200) {
        _responseLog(
            url, response.statusCode, response.body, response.headers, true);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedBody,
        );
      } else {
        _responseLog(
            url, response.statusCode, response.body, response.headers, false);
        if (response.statusCode == 401) {
          _moveToLogin();
        }
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      _responseLog(url, -1, null, {}, false, e);
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url, {}, body ?? {}, AuthController.accessToken ?? '');
      final Response response = await post(
        uri,
        headers: {
          'token': '${AuthController.accessToken}',
          'content-type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        _responseLog(
            url, response.statusCode, response.body, response.headers, true);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedBody,
        );
      } else {
        _responseLog(
            url, response.statusCode, response.body, response.headers, false);
        if (response.statusCode == 401) {
          _moveToLogin();
        }
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      _responseLog(url, -1, null, {}, false, e);
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> _moveToLogin() async {
    await authController.clearUserData();
    getx.Get.to(() => const EmailVerificationScreen());
  }

  void _requestLog(String url, Map<String, dynamic> params,
      Map<String, dynamic> body, String token) {
    logger.i('''
    Url: $url
    Params: $params
    Body: $body,
    Token: $token
    ''');
  }

  void _responseLog(String url, int statusCode, dynamic responseBody,
      Map<String, dynamic> headers, bool isSuccess,
      [dynamic error]) {
    String message = '''
    Url: $url
    Status Code: $statusCode
    Headers: $headers,
    Response Body: $responseBody,
    Error: $error,
    ''';
    if (isSuccess) {
      logger.i(message);
    } else {
      logger.e(message);
    }
  }
}
