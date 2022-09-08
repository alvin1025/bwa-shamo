import 'package:get/get.dart';
import 'package:sneakerz/Routing/route_name.dart';
import 'package:sneakerz/pages/cart_page.dart';
import 'package:sneakerz/pages/checkout_page.dart';
import 'package:sneakerz/pages/checkout_success_page.dart';
import 'package:sneakerz/pages/edit_profile_pages.dart';
import 'package:sneakerz/pages/home/main_page.dart';
import 'package:sneakerz/pages/sign_in_pages.dart';
import 'package:sneakerz/pages/sign_up_pages.dart';
import 'package:sneakerz/pages/splash_pages.dart';

class RoutingGetX{
  List<GetPage<dynamic>> route = [
    GetPage(name: RouteNameGetX().splash, page: () => const SplashPage()),
    GetPage(name: RouteNameGetX().home, page: () => const MainPage()),
    GetPage(name: RouteNameGetX().signIn, page: () => const SignInPage()),
    GetPage(name: RouteNameGetX().signUp, page: () => SignUpPage()),
    GetPage(name: RouteNameGetX().editProfile, page: () => const EditProfile()),
    GetPage(name: RouteNameGetX().cart, page: () => const CartPage()),
    GetPage(name: RouteNameGetX().checkout, page: () => const CheckOutPage()),
    GetPage(name: RouteNameGetX().checkoutSuccess, page: () => const CheckoutSuccessPage())
  ];
}