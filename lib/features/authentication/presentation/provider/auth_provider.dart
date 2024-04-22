import 'package:flutter/material.dart';

import '../../../../lib.dart';

enum AuthState { loading, noData, hasData, error }

/// todo 5: create Auth Provider to handle auth process
class AuthProvider extends ChangeNotifier {
  final AuthRepository _repository;

  AuthProvider(this._repository);

  bool isLoadingLogin = false;
  bool isLoadingLogout = false;
  bool isLoadingRegister = false;
  bool isLoggedIn = false;

  late AuthState _state;
  AuthState get state => _state;

  late Register _register;
  Register get register => _register;

  String _message = '';
  String get message => _message;

  Future<bool> login(User user) async {
    isLoadingLogin = true;
    notifyListeners();
    final userState = await _repository.getUser();
    if (user == userState) {
      await _repository.login();
    }
    isLoggedIn = await _repository.isLoggedIn();
    isLoadingLogin = false;
    notifyListeners();
    return isLoggedIn;
  }

  Future<bool> logout() async {
    isLoadingLogout = true;
    notifyListeners();
    final logout = await _repository.logout();
    if (logout) {
      await _repository.deleteUser();
    }
    isLoggedIn = await _repository.isLoggedIn();
    isLoadingLogout = false;
    notifyListeners();
    return !isLoggedIn;
  }

  Future<bool> saveUser(User user) async {
    isLoadingRegister = true;
    notifyListeners();
    final userState = await _repository.saveUser(user);
    isLoadingRegister = false;
    notifyListeners();
    return userState;
  }
}
