import 'package:get/get.dart';
import 'package:sneakerz/models/product_model.dart';

class WishlistController extends GetxController {
  List<ProductModel> wishlist = [];

  setProduct(ProductModel product) {
    if (!isWishlist(product)) {
      wishlist.add(product);
    } else {
      wishlist.removeWhere((element) => element.id == product.id);
    }

    update();
  }

  isWishlist(ProductModel product) {
    // cek jika wishlist kosong
    if (wishlist.indexWhere((element) => element.id == product.id) == -1) {
      return false;  
    } else {
      return true;
    }
    
  }
}
