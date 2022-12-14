import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  static String mainURL = 'http://api.dev.hashgamehub.com';
  var loginURL = '$mainURL/api/anon/member/validate';

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    }
    return false;
  }

  Future<bool> validateToken(token) async {
    try {
      // Response response = await _dio.get('$loginURL?token=$token');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    // storage.deleteAll();
  }

  Future<String> login(String email, String password) async {
    Response response = await _dio.post(loginURL, data: {
      "ia": email,
      "ip": password,
    });

    return response.data['data']['gToken'];
  }
}
