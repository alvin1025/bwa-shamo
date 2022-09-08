import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sneakerz/Controller/cart_controller.dart';
import 'package:sneakerz/Controller/product_controller.dart';
import 'package:sneakerz/Controller/wishlist_controller.dart';
import 'package:sneakerz/Routing/route_name.dart';
import 'package:sneakerz/models/product_model.dart';
import 'package:sneakerz/pages/detail_chat_page.dart';
import 'package:sneakerz/pages/home/chat_pages.dart';
import 'package:sneakerz/providers/cart_provider.dart';
import 'package:sneakerz/providers/wishlist_provider.dart';
import 'package:sneakerz/theme.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  ProductPage(this.product);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/Sepatu.png',
    'assets/Sepatu.png',
    'assets/Sepatu.png',
  ];

  List familiarShoes = [
    'assets/Sepatu.png',
    'assets/Sepatu2.png',
    'assets/Sepatu3.png',
    'assets/Sepatu4.png',
    'assets/Sepatu5.png',
    'assets/Sepatu7.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    // CartProvider cartProvider = Provider.of<CartProvider>(context);

    var wishList = Get.find<WishlistController>();
    var cart = Get.find<CartController>();
    // var product = Get.find<ProductController>();

    //NOTE: MODALS
    Future<void> showSuccessDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => Container(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: AlertDialog(
                  backgroundColor: bgColor3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              color: primaryTextColor,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/Success_Icon.png',
                          width: 100,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Hurray :)',
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Item added successfully',
                          style: secondaryTextStyle,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 155,
                          height: 44,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(RouteNameGetX().cart);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text(
                              'View My Cart',
                              style: primaryTextStyle.copyWith(
                                  fontSize: 16, fontWeight: medium),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
    }

    Widget indicator(int index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
            color:
                currentIndex == index ? primaryColor : const Color(0xffC4C4C4),
            borderRadius: BorderRadius.circular(10)),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.chevron_left),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: bgColor1,
                    ))
              ],
            ),
          ),
          CarouselSlider(
            items: widget.product.galleries!
                .map(
                  (image) => Image.network(
                    '${image.url}',
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries!.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(image: AssetImage(imageUrl))),
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        margin: const EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: bgColor1,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            //Note : Header

            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  right: defaultMargin,
                  left: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.product.name}",
                        style: primaryTextStyle.copyWith(
                            fontSize: 19, fontWeight: semiBold),
                      ),
                      Text(
                        '${widget.product.category?.name}',
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      wishList.setProduct(widget.product);
                      if (wishList.isWishlist(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text(
                              'Has been added to the Wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text(
                              'Has been removed from the Wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                      // wishlistProvider.setProduct(widget.product);
                      // if (wishlistProvider.isWishlist(widget.product)) {
                      //   ScaffoldMessenger.of(context)
                      //       .showSnackBar(const SnackBar(
                      //           backgroundColor: secondaryColor,
                      //           content: Text(
                      //             'Has been added to the Wishlist',
                      //             textAlign: TextAlign.center,
                      //           )));
                      // } else {
                      //   ScaffoldMessenger.of(context)
                      //       .showSnackBar(const SnackBar(
                      //           backgroundColor: alertColor,
                      //           content: Text(
                      //             'Has been removed from the Wishlist',
                      //             textAlign: TextAlign.center,
                      //           )));
                      // }
                    },
                    child: Image.asset(
                      // wishlistProvider.isWishlist(widget.product)
                      //     ? 'assets/WishLove.png'
                      //     :
                      (wishList.isWishlist(widget.product)) ? 
                      'assets/WishLove.png' : 'assets/Button_Wishlist.png',
                      width: 46,
                    ),
                  )
                ],
              ),
            ),

            //Note: Price

            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              width: 315,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              decoration: BoxDecoration(
                  color: bgColor2, borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  )
                ],
              ),
            ),

            //Note : Description

            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  right: defaultMargin,
                  left: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${widget.product.description}',
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),

            //NOTE: Familiar Shoes
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Familiar Shoes',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map((image) {
                        index++;
                        return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0),
                            child: familiarShoesCard(image));
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),

            //NOTE : BUTTONS
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailChat(widget.product),
                        ),
                      );
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/Button_Chat.png'))),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {
                            cart.addCart(widget.product);
                            // cartProvider.addCart(widget.product);
                            showSuccessDialog();
                          },
                          child: Text(
                            'Add to Cart',
                            style: primaryTextStyle.copyWith(
                                fontSize: 16, fontWeight: semiBold),
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: bgColor6,
        body: ListView(
          children: [header(), content()],
        ));
  }
}
