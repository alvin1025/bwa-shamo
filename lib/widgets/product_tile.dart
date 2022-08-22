import 'package:flutter/material.dart';
import 'package:sneakerz/models/product_model.dart';
import 'package:sneakerz/theme.dart';

class ProductTile extends StatelessWidget {
  // const ProductTile({Key? key}) : super(key: key);
  final ProductModel product;
  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                '${product.galleries?[0].url}',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
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
                    '${product.category?.name}',
                    style: subtitleTextStyle.copyWith(
                        fontSize: 12, fontWeight: reguler),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${product.name}',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}