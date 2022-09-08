import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakerz/Routing/route_name.dart';
import 'package:sneakerz/Url/base_url.dart';
import 'dart:convert';

import 'package:sneakerz/models/user_model.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{

  UserModel? user;

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  Future <void> login({
    required String? email, 
    required String? password
    }) async {

      var url = urlLogin;
      var headers = {'Content-Type' : 'application/json'};
      var body =
        jsonEncode({
        'email' : email,
        'password' : password});

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body);

        // print('${body}');
        print('ini respon body : ${response.body}');
        // return;

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        print("ini data : ${data}");
        // UserModel user = UserModel.fromJson(data['user']);
        user = UserModel.fromJson(data['user']);
        user?.token = 'Bearer ' + data['access_token'];
        print('${user?.token}');

        Get.toNamed(RouteNameGetX().home);
        // batas jalan program
      } else {
        // throw Exception('Gagal Login!');
        Get.snackbar('Error', 'User & Password Salah');
      }
  }

}