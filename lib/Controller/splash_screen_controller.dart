import 'package:get/get.dart';
import 'package:sneakerz/Controller/product_controller.dart';
import 'package:sneakerz/Routing/route_name.dart';

class SplashScreenController extends GetxController{

    // on init 
    // block progrem pertama yang dijalankan ketika render aplikasi
    @override
  void onInit() {
    // TODO: implement onInit
    getInit();
    
    super.onInit();
  }

  getInit() async {
    // await Provider.of<ProductProvider>(context, listen: false).getProducts();

    // await agar menunggu data (wajib async)

    // await listProduct;
    // print('${listProduct}');
    Get.put(ProductController());
    await Get.find<ProductController>().getProducts();

    await Future.delayed(Duration(seconds: 3));
    print("masuk sini");    // Navigator.pushNamed(context, '/sign-in');
    Get.offNamed(RouteNameGetX().signIn);
  }
}