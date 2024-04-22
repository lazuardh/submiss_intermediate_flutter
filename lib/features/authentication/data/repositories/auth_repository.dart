import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lib.dart';

/// todo 3: create Auth Repository and
/// add some method for auth process
class AuthRepository {
  final AuthDataSource _remoteDataSource;

  AuthRepository(this._remoteDataSource);

  final String stateKey = 'state';

  Future<String> createUser(Register register) async {
    try {
      return await _remoteDataSource.createUser(register);
    } catch (e) {
      print("Error in repository: $e");
      throw Exception(e);
    }
  }

  Future<bool> isLoggedIn() async {
    final preference = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 3));
    return preference.getBool(stateKey) ?? false;
  }

  Future<bool> login() async {
    final preferences = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 3));
    return preferences.setBool(stateKey, true);
  }

  Future<bool> logout() async {
    final preferences = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 3));
    return preferences.setBool(stateKey, false);
  }

  /// todo 4: add user manager to handle user information like email and password
  final String userKey = "user";

  Future<bool> saveUser(User user) async {
    final preferences = await SharedPreferences.getInstance();

    await _remoteDataSource.login(user);

    await Future.delayed(const Duration(seconds: 3));
    return preferences.setString(userKey, user.toJson());
  }

  Future<bool> deleteUser() async {
    final preferences = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 3));
    return preferences.setString(userKey, "");
  }

  Future<User?> getUser() async {
    final preferences = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 3));
    final json = preferences.getString(userKey) ?? "";
    User? user;
    try {
      user = User.fromJson(json);
    } catch (e) {
      user = null;
    }
    return user;
  }
}
