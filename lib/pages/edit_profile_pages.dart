import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sneakerz/models/user_model.dart';
import 'package:sneakerz/providers/auth_provider.dart';
import 'package:sneakerz/theme.dart';

import '../Controller/login_controller.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userController= Get.find<LoginController>();
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel? user = authProvider.user;

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(
                  fontSize: 13, fontWeight: reguler),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: userController.user?.name,
                hintStyle: primaryTextStyle.copyWith(fontSize: 16),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(
                  fontSize: 13, fontWeight: reguler),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '@${userController.user?.username}',
                hintStyle: primaryTextStyle.copyWith(fontSize: 16),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: secondaryTextStyle.copyWith(
                  fontSize: 13, fontWeight: reguler),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: userController.user?.email,
                hintStyle: primaryTextStyle.copyWith(fontSize: 16),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/Profile_Icon.png'),
                  )),
            ),
            nameInput(),
            usernameInput(),
            emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
        backgroundColor: bgColor1,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.check,
                color: primaryColor,
              ))
        ],
      ),
      body: SingleChildScrollView(child: content()),
    );
  }
}
