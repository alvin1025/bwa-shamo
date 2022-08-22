import 'package:flutter/material.dart';
import 'package:sneakerz/theme.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
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
                image: AssetImage('assets/Sepatu.png'),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terrex Urban Low',
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$143,98',
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          Text(
            '2 Items',
            style:
                subtitleTextStyle.copyWith(fontWeight: reguler, fontSize: 12),
          )
        ],
      ),
    );
  }
}
