import 'package:get/get.dart';
import 'package:sneakerz/models/cart_model.dart';
import 'package:sneakerz/models/product_model.dart';

class CartController extends GetxController{
  List<CartModel> carts = [];

  addCart(ProductModel product) {
    if (productExist(product)) {
      int index =
          carts.indexWhere((element) => element.product?.id == product.id);
      carts[index].quantity = carts[index].quantity! + 1;
    } else {
      carts.add(
        CartModel(
          id: carts.length,
          product: product,
          quantity: 1,
        ),
      );
    }

    update();
  }

  removeCart(int id){
    carts.removeAt(id);
    update();
  }

  addQuantity(int id){
    carts[id].quantity = carts[id].quantity! + 1;
    update();
  }

  reduceQuantity(int id){
    carts[id].quantity = carts[id].quantity! - 1;
    if (carts[id].quantity == 0) {
      carts.removeAt(id);
    }
    update();
  }

  totalItem(){
    int total = 0;
    for (var item in carts) {
      total += item.quantity!;
    }

    return total;
  }

  totalPrice(){
    double total = 0;
    for (var item in carts) {
      total += (item.quantity! * item.product!.price!);
    }
    return total;
  }

  productExist(ProductModel product) {
    if (carts.indexWhere((element) => element.product?.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}