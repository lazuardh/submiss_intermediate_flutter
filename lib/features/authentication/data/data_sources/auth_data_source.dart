import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../lib.dart';

class AuthDataSource {
  Future<String> createUser(Register register) async {
    final response = await http.post(
      Uri.parse(UrlConstant.register),
      body: register.toJson(),
    );

    final responseData = jsonDecode(response.body);
    final errorMessage = responseData["message"];
    print(errorMessage);
    return errorMessage;
  }

  Future<UserResult> login(User user) async {
    final response = await http.post(
      Uri.parse(UrlConstant.login),
      body: user.toJson(),
    );

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return UserResult.fromJson(response.body);
    } else {
      final errorMessage = responseData["message"];
      throw Exception(errorMessage);
    }
  }
}
