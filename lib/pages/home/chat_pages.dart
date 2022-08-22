import 'package:flutter/material.dart';
import 'package:sneakerz/theme.dart';
import 'package:sneakerz/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
          child: Container(
        color: bgColor3,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Headset_Icon.png',
              width: 80,
              height: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Opss no message yet?',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'You have never done a transaction',
              style:
                  subtitleTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 44,
              width: 152,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  )),
            )
          ],
        ),
      ));
    }

    Widget content() {
      return Expanded(
          child: Container(
        color: bgColor3,
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [ChatTile()],
        ),
      ));
    }

    return Column(
      children: [header(), content()],
    );
  }
}
