import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakerz/Routing/route_name.dart';
import 'package:sneakerz/Url/base_url.dart';
import 'package:sneakerz/models/user_model.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  UserModel? user;

  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  Future<void> register(
      {required String? name,
      required String? username,
      required String? email,
      required String? password}) async {

    var url = urlRegister;
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print('respon body : ${response.body}');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      print("ini data : ${data}");
      
      user = UserModel.fromJson(data['user']);
      user?.token = 'Bearer ' + data['access_token'];

      print('${user?.token}');
      Get.toNamed(RouteNameGetX().signIn);
      Get.snackbar('Success', 'Silahkan Login!');

      // return user as UserModel;
    } else {
      // throw Exception('Gagal Register!');
      Get.snackbar('Error', 'Ada Kesalahan Input');
    }
  }
}
