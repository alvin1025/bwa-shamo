import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:provider/provider.dart';
import 'package:sneakerz/Controller/login_controller.dart';
import 'package:sneakerz/Routing/route_name.dart';
import 'package:sneakerz/pages/home/main_page.dart';
import 'package:sneakerz/pages/sign_up_pages.dart';
import 'package:sneakerz/theme.dart';
import 'package:sneakerz/widgets/loading_button.dart';

import '../providers/auth_provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // handleSignIn() async {

    //   setState(() {
    //     isLoading = true;
    //   });

    //   if (await authProvider.login(
    //     email: emailController.text,
    //     password: passwordController.text,
    //   )) {
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => const MainPage()));
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //         backgroundColor: alertColor,
    //         content: const Text(
    //           'Gagal Login',
    //           textAlign: TextAlign.center,
    //         )));
    //   }

    //   setState(() {
    //     isLoading = false;
    //   });
    // }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style:
                  primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Sign In to Countinue',
              style:
                  subtitleTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
            )
          ],
        ),
      );
    }

    Widget emailInput(TextEditingController email) {
      return Container(
        margin: const EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              // margin: EdgeInsets.symmetric(horizontal: 14),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: bgColor2, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Email_Icon.png',
                      width: 17,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: primaryTextStyle,
                      controller: email,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: subtitleTextStyle),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordInput(TextEditingController password) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              // margin: EdgeInsets.symmetric(horizontal: 14),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: bgColor2, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Password_Icon.png',
                      width: 17,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      // obscureText: true,
                      style: primaryTextStyle,
                      controller: password,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget buttonSignIn() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        height: 50,
        width: double.infinity,
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () async {
              print(Get.find<LoginController>().emailController.text);
              print(Get.find<LoginController>().passwordController.text);
              await Get.find<LoginController>().login(email: Get.find<LoginController>().emailController.text, password: Get.find<LoginController>().passwordController.text);
            },
            child: Text(
              'Sign In',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            )),
      );
    }
    

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style:
                  subtitleTextStyle.copyWith(fontSize: 12, fontWeight: reguler),
            ),
            TextButton(
                onPressed: () {
                  Get.toNamed(RouteNameGetX().signUp);
                },
                child: Text(
                  'Sign Up',
                  style: purpleTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ))
          ],
        ),
      );
    }

    return GetBuilder<LoginController>(
      builder: (login) {
        return Scaffold(
          backgroundColor: bgColor1,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(),
                  emailInput(login.emailController),
                  passwordInput(login.passwordController),
                  login.isLoading ? const LoadingButton() : buttonSignIn(),
                  const Spacer(),
                  footer()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
