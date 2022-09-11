import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:provider/provider.dart';
import 'package:sneakerz/Controller/cart_controller.dart';
import 'package:sneakerz/models/cart_model.dart';
import 'package:sneakerz/providers/cart_provider.dart';
import 'package:sneakerz/theme.dart';

class CartCard extends StatelessWidget {
  // const CartCard({Key? key}) : super(key: key);
  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    // CartProvider cartProvider = Provider.of<CartProvider>(context);
    var cartController = Get.find<CartController>();

    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage('${cart.product?.galleries?[0].url}'),
                  ),
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
                      '${cart.product?.name}',
                      style: primaryTextStyle.copyWith(fontWeight: semiBold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$${cart.product?.price}',
                      style: priceTextStyle,
                    )
                  ],
                ),
              ),
              GetBuilder<CartController>(
                initState: (_) {},
                builder: (_) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          cartController.addQuantity(cart.id!);
                        },
                        child: Image.asset(
                          'assets/Button_Add.png',
                          width: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        cart.quantity.toString(),
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          cartController.reduceQuantity(cart.id!);
                        },
                        child: Image.asset(
                          'assets/Button_Min.png',
                          width: 16,
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartController.removeCart(cart.id!);
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/Remove.png',
                  width: 10,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Remove',
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: light),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
