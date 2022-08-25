import 'package:flutter/material.dart';
import 'package:sneakerz/models/product_model.dart';
import 'package:sneakerz/theme.dart';
import 'package:sneakerz/widgets/chat_buble.dart';

class DetailChat extends StatefulWidget {
  // const DetailChat({Key? key}) : super(key: key);
  ProductModel product;
  DetailChat(this.product);

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  @override
  Widget build(BuildContext context) {


    Widget productReview() {
      return Container(
        width: 225,
        height: 74,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: bgColor5,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                '${widget.product.galleries?[0].url}',
                width: 54,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.product.name}',
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Image.asset(
                'assets/Button_Close.png',
                width: 22,
              ),
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.product is UninitializedProductModel ? const SizedBox() : productReview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        color: bgColor4,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Typle Message...',
                            hintStyle: subtitleTextStyle),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/Send_Button.png',
                  width: 45,
                  height: 45,
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          ChatBuble(
            isSender: true,
            text: 'Hi, This item is still available?',
            hasProduct: true,
          ),
          ChatBuble(
            isSender: false,
            text: 'Good night, This item is only available in size 42 and 43',
          )
        ],
      );
    }

    return Scaffold(
        backgroundColor: bgColor3,
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: bgColor1,
              centerTitle: false,
              title: Row(
                children: [
                  Image.asset(
                    'assets/Logo_Online.png',
                    width: 40,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                      Text(
                        'Online',
                        style: secondaryTextStyle.copyWith(
                            fontWeight: light, fontSize: 14),
                      )
                    ],
                  )
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(70)),
        bottomNavigationBar: chatInput(),
        body: content());
  }
}
