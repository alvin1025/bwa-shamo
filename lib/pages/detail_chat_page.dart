import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakerz/Controller/login_controller.dart';
// import 'package:provider/provider.dart';
import 'package:sneakerz/models/message_model.dart';
import 'package:sneakerz/models/product_model.dart';
// import 'package:sneakerz/providers/auth_provider.dart';
import 'package:sneakerz/services/message_service.dart';
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
  TextEditingController messageController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    var userController= Get.find<LoginController>();

    handleAddMessage() async {
      MessageService().addMessage(
          user: userController.user,
          isFromUser: true,
          product: widget.product,
          message: messageController.text);

      setState(() {
        widget.product = UninitializedProductModel();
        messageController.text = '';
      });
    }

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
            widget.product is UninitializedProductModel
                ? const SizedBox()
                : productReview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        color: bgColor4,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        controller: messageController,
                        style: primaryTextStyle,
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
                GestureDetector(
                  onTap: handleAddMessage,
                  child: Image.asset(
                    'assets/Send_Button.png',
                    width: 45,
                    height: 45,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>?>(
          stream: MessageService()
              .getMessagesByUserId(userId: userController.user?.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                children: snapshot.data!.map((MessageModel message) => ChatBuble(
                  isSender: message.isFromUser,
                  text: message.message,
                )).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          });
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
