import 'dart:convert';

import 'package:auth_bloc/model/Login_model.dart';
import 'package:auth_bloc/model/cart_response_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class UserRepository {
  static String mainUrl = "https://ecommerce.theprimoapp.com";
  var loginUrl = '$mainUrl/api/login';
  var signupUrl = '$mainUrl/api/registration';
  var getCartListUrl = '$mainUrl/api/get_cart_items';

  final FlutterSecureStorage storage = new FlutterSecureStorage();
  // final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  login(String email, String password) async {
    // _dio.options.headers["Cookie"] = "ci_session=0d75972bc917147007c8cbe88cc0e46fa133fe7f";
    Response response = await http.post(
      Uri.parse("${loginUrl}"),
      body: {
        "email": email.toString(),
        "password": password.toString(),
        "device_token": "ssssssss",
      },
      headers: {
        'Cookie': 'ci_session=0d75972bc917147007c8cbe88cc0e46fa133fe7f'
      },
    );
    final body = json.decode(response.body);
    print("<<<<<<<<<<<<<<<<<<<${body['result']['id']}");

    storage.write(key: "id", value: (body['result']['id']));
    return response.body;
  }

  Future<String> signup(context, String name, String surname, String email,
      String password, String resetPassword) async {
    Response response = await http.post(
      Uri.parse(signupUrl),
      body: {
        "first_name": name,
        "last_name": surname,
        "email": email,
        "password": password,
        // "resetPassword": resetPassword,
      },
      headers: {
        'Cookie': 'ci_session=0d75972bc917147007c8cbe88cc0e46fa133fe7f'
      },
    );
    final body = json.decode(response.body);
    print("<<<<<<<<<<<<<<<<<<<${response.body}");
    storage.write(key: "id", value: (body['result']['id']));

    if (body['status'] == 200) {
      Navigator.pop(context);
    }

    return response.body;
  }
}
