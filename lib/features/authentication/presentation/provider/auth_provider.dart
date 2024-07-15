import 'package:flutter/material.dart';

import '../../../../lib.dart';

enum AuthState { loading, noData, hasData, error }

/// TODO mengelola state aplikasi
class AuthProvider extends ChangeNotifier {
  final AuthRepository _repository;

  AuthProvider(this._repository);

  bool isLoadingLogin = false;
  bool isLoadingLogout = false;
  bool isLoadingRegister = false;
  bool isLoggedIn = false;

  late AuthState _state;
  AuthState get state => _state;

  String _message = '';
  String get message => _message;

  Future<void> signUp(String name, String email, String password) async {
    isLoadingRegister = true;
    _state = AuthState.loading;
    notifyListeners();

    try {
      final response = await _repository.createUser(name, email, password);

      _message = response;
      _state = AuthState.hasData;
    } catch (error) {
      _message = '$error';
      _state = AuthState.error;
    } finally {
      isLoadingRegister = false;
      notifyListeners();
    }
  }

  Future<bool> login(User user) async {
    isLoadingLogin = true;
    notifyListeners();

    try {
      final userResponse = await _repository.login(user);

      if (userResponse) {
        isLoggedIn = await _repository.isLoggedIn();
      } else {
        _message = "Login failed";
        isLoggedIn = false;
      }

      isLoadingLogin = false;
      notifyListeners();

      return isLoggedIn;
    } catch (error) {
      print(error);
      _message = error.toString();
      isLoggedIn = false;
      return false;
    } finally {
      isLoadingLogin = false;
      notifyListeners();
    }
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
