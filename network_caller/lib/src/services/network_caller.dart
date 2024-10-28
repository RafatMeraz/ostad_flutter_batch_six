import 'dart:convert';
import 'dart:ui';
import 'package:logger/logger.dart';

import 'package:http/http.dart';
import 'package:logger/web.dart';
import 'package:network_caller/src/models/network_response.dart';

class NetworkCaller {
  final Logger logger;
  String _accessToken = '';
  final VoidCallback onTokenUnauthorize;

  NetworkCaller({required this.logger, required this.onTokenUnauthorize});

  set accessToken(String token) => _accessToken = token;

  Future<NetworkResponse> getRequest(
      {required String url, String? token}) async {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url, {}, {}, '');
      final Response response = await get(uri, headers: {
        'token': token ?? _accessToken,
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
      _requestLog(url, {}, body ?? {}, _accessToken);
      final Response response = await post(
        uri,
        headers: {
          'token': _accessToken,
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
    onTokenUnauthorize();
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
