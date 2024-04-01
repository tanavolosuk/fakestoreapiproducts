import 'package:fakestoreapiproducts/app/data/repositories/product_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ProductRepository _productRepository;
  final _products = ProductListResponse.loading().obs;

  HomeController(this._productRepository);

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  Future<void> getProducts() async {
    _products.value = ProductListResponse.loading();
    _products.value = await _productRepository.getAll();
  }

  ProductListResponse get products => _products.value;
}
