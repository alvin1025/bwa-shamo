import 'package:flutter/material.dart';
import 'package:sneakerz/models/message_model.dart';
import 'package:sneakerz/models/product_model.dart';
import 'package:sneakerz/pages/detail_chat_page.dart';
import 'package:sneakerz/theme.dart';

class ChatTile extends StatelessWidget {
  // const ChatTile({Key? key}) : super(key: key);

  final MessageModel message;
  ChatTile(this.message);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChat(
              UninitializedProductModel(),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/Logo_Shop.png',
                  width: 54,
                  height: 54,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: reguler),
                      ),
                      Text(
                        message.message!,
                        style: secondaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: light),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(
                      fontSize: 10, fontWeight: reguler),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            )
          ],
        ),
      ),
    );
  }
}
