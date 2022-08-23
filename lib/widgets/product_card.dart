import 'package:flutter/material.dart';
import 'package:sneakerz/models/product_model.dart';
import 'package:sneakerz/pages/product_page.dart';
import 'package:sneakerz/theme.dart';

class ProductCard extends StatelessWidget {
  // const ProductCard({Key? key}) : super(key: key);

  final ProductModel? product;
  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product!),
          ),
        );
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: const Color(0xffECEDEF)),
        child: Container(
          margin: EdgeInsets.only(left: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.network(
                '${product?.galleries?[0].url}',
                width: 215,
                height: 150,
                fit: BoxFit.cover,
              ),
              Text(
                '${product?.category?.name}',
                style: secondaryTextStyle.copyWith(
                    fontSize: 12, fontWeight: reguler),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                '${product?.name}',
                style:
                    blacktextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                '\$${product?.price}',
                style:
                    priceTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              )
            ],
          ),
        ),
      ),
    );
  }
}
