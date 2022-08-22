import 'package:flutter/material.dart';
import 'package:sneakerz/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Empty_Cart_Icon.png',
              width: 78,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You made a transaction',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Stay at home while we\nprepare your dream shoes',
              style: secondaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: reguler,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 180,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(12)),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: Text(
                  'Order Other Shoes',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              width: 180,
              decoration: BoxDecoration(
                  color: Color(0xff39374B),
                  borderRadius: BorderRadius.circular(12)),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'View My Order',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          'Checkout Success',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: content(),
    );
  }
}
