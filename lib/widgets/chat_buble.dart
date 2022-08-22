import 'package:flutter/material.dart';
import 'package:sneakerz/theme.dart';

class ChatBuble extends StatelessWidget {
  final String? text;
  final bool? isSender;
  final bool? hasProduct;

  ChatBuble({this.isSender = false, this.text = '', this.hasProduct = false});

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        width: 230,
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSender! ? bgColor5 : bgColor4,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender! ? 12 : 0),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
            topRight: Radius.circular(isSender! ? 0 : 12),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/Sepatu.png',
                    width: 70,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'COURT VISION 2.0 SHOES',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                        // overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '\$57,15',
                        style: priceTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: primaryColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      'Add to Cart',
                      style: purpleTextStyle,
                    )),
                SizedBox(
                  width: 8,
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      'Buy Now',
                      style: notSoBlackTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ))
              ],
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment:
            isSender! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct! ? productPreview() : SizedBox(),
          Row(
            mainAxisAlignment:
                isSender! ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(isSender! ? 12 : 0),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        topRight: Radius.circular(isSender! ? 0 : 12)),
                    color: isSender! ? bgColor5 : bgColor4,
                  ),
                  child: Text(
                    text!,
                    style: primaryTextStyle,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
