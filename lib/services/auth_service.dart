import 'package:flutter/foundation.dart';

class AuthService {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    debugPrint('Login: $email');
    return true;
  }

  Future<bool> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    debugPrint('Signup: $name, $email');
    return true;
  }

  Future<void> logout() async {
    debugPrint('Logout');
  }
}
