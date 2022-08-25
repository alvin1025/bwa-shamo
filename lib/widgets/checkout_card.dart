import 'package:flutter/material.dart';
import 'package:sneakerz/models/cart_model.dart';
import 'package:sneakerz/theme.dart';

class CheckoutCard extends StatelessWidget {
  // const CheckoutCard({Key? key}) : super(key: key);
  final CartModel cart;
  CheckoutCard(this.cart);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
          color: bgColor4, borderRadius: BorderRadius.circular(12)),
      child: Row(
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
          Text(
            '${cart.quantity} Items',
            style:
                subtitleTextStyle.copyWith(fontWeight: reguler, fontSize: 12),
          )
        ],
      ),
    );
  }
}
