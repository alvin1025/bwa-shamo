import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sneakerz/Controller/cart_controller.dart';
import 'package:sneakerz/Controller/login_controller.dart';
import 'package:sneakerz/Controller/product_controller.dart';
import 'package:sneakerz/Controller/transaction_controller.dart';
import 'package:sneakerz/Routing/route_name.dart';
import 'package:sneakerz/providers/auth_provider.dart';
import 'package:sneakerz/providers/cart_provider.dart';
import 'package:sneakerz/providers/transaction_provider.dart';
import 'package:sneakerz/theme.dart';
import 'package:sneakerz/widgets/checkout_card.dart';
import 'package:sneakerz/widgets/loading_button.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var userModel = Get.find<LoginController>();
    var productController = Get.find<ProductController>();
    var cartController = Get.find<CartController>();
    var transactionController = Get.find<TransactionController>();


    // CartProvider cartProvider = Provider.of<CartProvider>(context);
    // TransactionProvider transactionProvider =
    //     Provider.of<TransactionProvider>(context);
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });

      if (await transactionController.checkout('${userModel.user?.token}',
          cartController.carts, cartController.totalPrice())) {
        cartController.carts = [];
        Get.toNamed(RouteNameGetX().checkoutSuccess);
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          // NOTE: LIST ITEM
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                Column(
                    children: cartController.carts
                        .map(
                          (cart) => CheckoutCard(cart),
                        )
                        .toList())
              ],
            ),
          ),

          //NOTE: ADDRESS DETAILS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: bgColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/Location_Store_Icon.png',
                          width: 40,
                        ),
                        Image.asset(
                          'assets/Dot_Line.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/Your_Address_Location.png',
                          width: 40,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Store Location',
                            style: secondaryTextStyle.copyWith(
                                fontSize: 12, fontWeight: light),
                          ),
                          Text(
                            'Adidas Core',
                            style: primaryTextStyle.copyWith(
                                fontWeight: medium, fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Text(
                            'Your Address',
                            style: secondaryTextStyle.copyWith(
                                fontSize: 12, fontWeight: light),
                          ),
                          Text(
                            'Marsemoon',
                            style: primaryTextStyle.copyWith(
                                fontWeight: medium, fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          //NOTE: PAYMENTS SUMMARY
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 16),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: secondaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      '${cartController.totalItem()} Items',
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: secondaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      '\$${cartController.totalPrice()}',
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: secondaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      'Free',
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xff2E3141),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    ),
                    Text(
                      '\$${cartController.totalPrice()}',
                      style: priceTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //NOTE: CHECKOUT BUTTON
          SizedBox(
            height: defaultMargin,
          ),
          isLoading
              ? const LoadingButton()
              : Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 13,
                        ),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: handleCheckout,
                      child: Text(
                        'Checkout Now',
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      )),
                )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgColor1,
        elevation: 0,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      ),
      body: content(),
    );
  }
}
