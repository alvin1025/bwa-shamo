import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakerz/Controller/wishlist_controller.dart';
// import 'package:provider/provider.dart';
import 'package:sneakerz/models/product_model.dart';
import 'package:sneakerz/providers/wishlist_provider.dart';
import 'package:sneakerz/theme.dart';

class WishlistCard extends StatelessWidget {
//  WishlistCard({Key? key}) : super(key: key);
 final ProductModel product;
 WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {
    // WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    var wishList = Get.find<WishlistController>();

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      width: 200,
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              '${product.galleries?[0].url}',
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.name}',
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle.copyWith(fontWeight: reguler),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              wishList.setProduct(product);
            },
            child: Image.asset(
              'assets/WishLove.png',
              width: 34,
            ),
          )
        ],
      ),
    );
  }
}
