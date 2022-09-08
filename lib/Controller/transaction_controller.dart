import 'dart:convert';

import 'package:get/get.dart';
import 'package:sneakerz/Url/base_url.dart';
import 'package:sneakerz/models/cart_model.dart';
import 'package:http/http.dart' as http;

class TransactionController extends GetxController{

  bool isLoading = false;

  Future<bool> checkout(
      String token, 
      List<CartModel> carts, 
      double totalPrice) async {
    var url = urlCheckout;
    var header = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'address': 'Marsemoon',
        'items': carts.map(
          (cart) => {
            'id': cart.product?.id,
            'quantity': cart.quantity,
          },
        )
        .toList(),
      'status': "PENDING",
      'total_price': totalPrice,
      'shipping_price': 0,
      },
    );

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body
    );

    print('response checkout body : ${response.body}');

    if (response.statusCode == 200) {
      update();
      return true;   
    }else{
      throw Exception('Gagal Melakukan Checkout');
      
    }
  }
}