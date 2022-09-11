import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:provider/provider.dart';
import 'package:sneakerz/Controller/splash_screen_controller.dart';
import 'package:sneakerz/providers/product_provider.dart';
import 'package:sneakerz/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  // void initState() {
  // TODO: implement initState

  // getInit();

  //   super.initState();
  // }

  // getInit() async {
  //   await Provider.of<ProductProvider>(context, listen: false).getProducts();
  //   Navigator.pushNamed(context, '/sign-in');
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: bgColor1,
          body: Center(
            child: Container(
              width: 130,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Splashscreen.png'))),
            ),
          ),
        );
      },
    );
  }
}
