import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
// import 'package:provider/provider.dart';
import 'package:sneakerz/Controller/cart_controller.dart';
import 'package:sneakerz/Controller/login_controller.dart';
import 'package:sneakerz/Controller/product_controller.dart';
import 'package:sneakerz/Controller/register_controller.dart';
import 'package:sneakerz/Controller/splash_screen_controller.dart';
import 'package:sneakerz/Controller/transaction_controller.dart';
import 'package:sneakerz/Controller/wishlist_controller.dart';
import 'package:sneakerz/Routing/routes.dart';
import 'package:sneakerz/pages/cart_page.dart';
import 'package:sneakerz/pages/checkout_page.dart';
import 'package:sneakerz/pages/checkout_success_page.dart';
// import 'package:sneakerz/pages/detail_chat_page.dart';
import 'package:sneakerz/pages/edit_profile_pages.dart';
import 'package:sneakerz/pages/home/main_page.dart';
// import 'package:sneakerz/pages/product_page.dart';
import 'package:sneakerz/pages/sign_in_pages.dart';
import 'package:sneakerz/pages/sign_up_pages.dart';
import 'package:sneakerz/pages/splash_pages.dart';
import 'package:sneakerz/providers/auth_provider.dart';
import 'package:sneakerz/providers/cart_provider.dart';
import 'package:sneakerz/providers/product_provider.dart';
import 'package:sneakerz/providers/transaction_provider.dart';
import 'package:sneakerz/providers/wishlist_provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // inisialisai controller
  Get.put(SplashScreenController());
  Get.put(LoginController());
  Get.put(RegisterController());
  Get.put(ProductController());
  Get.put(WishlistController());
  Get.put(CartController());
  Get.put(TransactionController());
  // Get.lazyPut(() => ProductController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // 404 notfound
      initialRoute: '/',
      getPages: RoutingGetX().route,
    );


  // return



  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(
  //         create: (context) => AuthProvider(),
  //       ),
  //       ChangeNotifierProvider(
  //         create: (context) => ProductProvider(),
  //       ),
  //       ChangeNotifierProvider(
  //         create: (context) => WishlistProvider(),
  //       ),
  //       ChangeNotifierProvider(
  //         create: (context) => CartProvider(),
  //       ),
  //       ChangeNotifierProvider(
  //         create: (context) => TransactionProvider(),
  //       ),
  //     ],
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       routes: {
  //         '/': (context) => SignUpPage(),
  //         '/sign-in': (context) => const SignInPage(),
  //         '/sign-up': (context) => SignUpPage(),
          // '/home': (context) => const MainPage(),
  //         '/edit-profile': (context) => const EditProfile(),
  //         '/cart': (context) => const CartPage(),
  //         '/checkout': (context) => const CheckOutPage(),
  //         '/checkout-success': (context) => const CheckoutSuccessPage(),
  //       },
  //     ),
  //   );
  }
}
