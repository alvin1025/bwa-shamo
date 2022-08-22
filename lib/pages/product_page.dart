import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sneakerz/models/product_model.dart';
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
    'assets/Sepatu.png',
    'assets/Sepatu.png',
    'assets/Sepatu.png',
    'assets/Sepatu.png',
    'assets/Sepatu.png',
  ];

  int currentIndex = 0;
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
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
                            child: Icon(
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
                            onPressed: () {},
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
            color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
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
                  icon: Icon(Icons.chevron_left),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_bag,
                      color: bgColor1,
                    ))
              ],
            ),
          ),
          CarouselSlider(
            items: images
                .map(
                  (image) => Image.asset(
                    image,
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
            children: images.map((e) {
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
        decoration: BoxDecoration(
          color: bgColor1,
          borderRadius: const BorderRadius.vertical(
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
                        "TERREX URBAN LOW",
                        style: primaryTextStyle.copyWith(
                            fontSize: 19, fontWeight: semiBold),
                      ),
                      Text(
                        'Hiking',
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isWishlist = !isWishlist;
                      });
                      if (isWishlist) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text(
                              'Has been added to the Wishlist',
                              textAlign: TextAlign.center,
                            )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: alertColor,
                            content: Text(
                              'Has been removed from the Wishlist',
                              textAlign: TextAlign.center,
                            )));
                      }
                    },
                    child: Image.asset(
                      isWishlist
                          ? 'assets/WishLove.png'
                          : 'assets/Button_Wishlist.png',
                      width: 46,
                    ),
                  )
                ],
              ),
            ),

            //Note: Price

            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              width: 315,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
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
                    '\$143,98',
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
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
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
                  SizedBox(
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
                      Navigator.pushNamed(context, '/detail-chat');
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/Button_Chat.png'))),
                    ),
                  ),
                  SizedBox(
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
