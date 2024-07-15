import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../lib.dart';

//TODO: interaksi with api
class AuthRemoteDataSource {
  Future<String> signUp(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse(UrlConstant.register),
      // body: register.toJson(),
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    final responseData = jsonDecode(response.body);
    if (response.statusCode == 201) {
      return responseData["message"];
    }

    throw responseData["message"];
  }

  Future<UserResponse> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(UrlConstant.login),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      final responseData = jsonDecode(response.body);
      throw Exception(responseData['message']);
    }
  }
}
