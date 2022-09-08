import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sneakerz/Controller/login_controller.dart';
import 'package:sneakerz/models/message_model.dart';
import 'package:sneakerz/providers/auth_provider.dart';
import 'package:sneakerz/services/message_service.dart';
import 'package:sneakerz/theme.dart';
import 'package:sneakerz/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userController = Get.find<LoginController>();
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);

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
            const SizedBox(
              height: 20,
            ),
            Text(
              'Opss no message yet?',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'You have never done a transaction',
              style:
                  subtitleTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
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
      return StreamBuilder<List<MessageModel>?>(
        stream:
            MessageService().getMessagesByUserId(userId: userController.user?.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if(snapshot.data!.isEmpty){
              return emptyChat();
            }
            return Expanded(
              child: Container(
                color: bgColor3,
                width: double.infinity,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  children: [
                    ChatTile(snapshot.data![snapshot.data!.length - 1])
                  ],
                ),
              ),
            );
          } else {
            return emptyChat();
          }
        },
      );
    }

    return Column(
      children: [header(), content()],
    );
  }
}
