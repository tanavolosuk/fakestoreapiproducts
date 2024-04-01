import 'package:fakestoreapiproducts/app/data/models/apiResponse/api_response.dart';
import 'package:fakestoreapiproducts/app/data/models/product/product.dart';
import 'package:fakestoreapiproducts/app/data/services/api_service.dart';

typedef ProductListResponse = ApiResponse<List<Product>>;
typedef JsonResponse = ApiResponse<dynamic>;

class ProductRepository {
  final ApiService _api;

  ProductRepository(this._api);

  Future<ProductListResponse> getAll() async {
    JsonResponse data = await _api.get('products');
    return data.when(
        loading: () => ProductListResponse.loading(),
        success: (jsonData) {
          var productJson = jsonData as List<dynamic>;
          var products =
              productJson.map((json) => Product.fromJson(json)).toList();
          return ProductListResponse.success(products);
        },
        failed: ((message, error) =>
            ProductListResponse.failed(message, error)));
  }
}
