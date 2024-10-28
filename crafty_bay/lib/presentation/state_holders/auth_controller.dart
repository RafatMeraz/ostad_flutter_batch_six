import 'package:shared_preferences/shared_preferences.dart';
import 'package:network_caller/network_caller.dart';

class AuthController {

  final NetworkCaller networkCaller;

  static String? accessToken;

  final String _accessTokenKey = 'access-token';

  AuthController({required this.networkCaller});

  Future<void> saveAccessToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    accessToken = token;
    networkCaller.accessToken = token;
  }

  Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString(_accessTokenKey);
    accessToken = token;
    networkCaller.accessToken = accessToken ?? '';
    return token;
  }

  bool isLoggedInUser() {
    return accessToken != null;
  }

  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    networkCaller.accessToken = '';
  }
}
