import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lib.dart';

/// todo mengelola logika bisnis dan abstraksi data dari datasource
class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepository(this._remoteDataSource);

  final String stateKey = 'state';
  final String userKey = "user";
  final String tokenKey = 'token';

  Future<String> createUser(String name, String email, String password) async {
    return await _remoteDataSource.signUp(name, email, password);
  }

  /* === memeriksa sesi login === */
  Future<bool> isLoggedIn() async {
    final preference = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    return preference.getBool(stateKey) ?? false;
  }

  Future<bool> login(User user) async {
    final preferences = await SharedPreferences.getInstance();
    final userResponse =
        await _remoteDataSource.login(user.email!, user.password!);

    print("id user me: ${userResponse.loginResult.userId}");

    await preferences.setString(userKey, jsonEncode(user.toJson()));
    await preferences.setString(tokenKey, userResponse.loginResult.token);
    // await Future.delayed(const Duration(seconds: 2));

    return preferences.setBool(stateKey, true);
  }

  Future<bool> logout() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.remove(tokenKey);
    await preferences.remove(userKey);
    await Future.delayed(const Duration(seconds: 2));
    return preferences.setBool(stateKey, false);
  }

  /* ======================================= */

  /* === menyimpan informasi pengguna saat melakukan registrasi akun === */

  Future<bool> saveUser(User user) async {
    final preferences = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    return preferences.setString(userKey, jsonEncode(user.toJson()));
  }

  Future<bool> deleteUser() async {
    final preferences = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    return preferences.setString(userKey, "");
  }

  Future<User?> getUser() async {
    final preferences = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    final json = preferences.getString(userKey) ?? "";
    User? user;
    try {
      user = User.fromJson(jsonDecode(json.toString()));
    } catch (e) {
      user = null;
    }
    return user;
  }

  /* ======================================================= */

  Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(tokenKey);
  }
}
