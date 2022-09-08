import 'package:get/get.dart';
import 'package:sneakerz/Url/base_url.dart';
import 'package:sneakerz/models/product_model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sneakerz/models/product_model.dart';


class ProductController extends GetxController{

  ProductModel? product;

  List<ProductModel> products = [];

  Future<void> getProducts() async{
    var url =  urlProduct;
    var headers = {'Content-Type' : 'application/json'};

    var response = await http.get(
        Uri.parse(url),
        headers: headers,
    );

    print('response body get Product: ${response.body}');

    if(response.statusCode == 200){

      List data = jsonDecode(response.body)['data']['data'];
      print('ini data : ${data}');
      
      // List product = [];

      for(var item in data){
        products.add(ProductModel.fromJson(item));
      }

      // fungsi lain notifylisteners
      update();

    } else {
      // throw Exception('Gagal Get Products');
      Get.snackbar('Error', 'Gagal Get Products');
    }

  }
}