import 'package:flutter/material.dart';
import 'package:sneakerz/theme.dart';
import 'package:sneakerz/widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          'Favorite Shoes',
          style: primaryTextStyle,
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
          child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Wishlist.png',
              width: 74,
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              'You don\'t have dream shoes?',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: subtitleTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ))
          ],
        ),
      ));
    }

    Widget content() {
      return Expanded(
          child: Container(
        color: bgColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [WishlistCard(), WishlistCard()],
        ),
      ));
    }

    return Column(
      children: [
        header(),
        // emptyWishlist(),
        content(),
      ],
    );
  }
}
