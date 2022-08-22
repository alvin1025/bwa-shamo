import 'package:flutter/material.dart';
import 'package:sneakerz/models/user_model.dart';
import 'package:sneakerz/services/auth_service.dart';

class AuthProvider with ChangeNotifier{

  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? user){
    notifyListeners();
  }

  // function utk register
  Future<bool> register({
    String? name, 
    String? username, 
    String? email, 
    String? password
    }) async {
      // pesan berahasil/ tidak register
      try {
        // berhasil
        UserModel user = await AuthService().register(
          name: name,
          username: username,
          password: password,
          email: email
        );

        _user = user;
        return true;
        // gagal
      } catch (e) {
        print(e);
        return false;
      }
    }

    // function utk login
  Future<bool> login({
    String? email, 
    String? password
    }) async {
      // pesan berahasil/ tidak login
      try {
        // berhasil
        UserModel user = await AuthService().login(
          password: password,
          email: email
        );

        _user = user;
        return true;
        // gagal
      } catch (e) {
        print(e);
        return false;
      }
    }
}