import 'package:fakestoreapiproducts/app/data/repositories/product_repository.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(ProductRepository(Get.find())),
    );
  }
}
