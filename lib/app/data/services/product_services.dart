import 'package:get/get.dart';
import '../providers/api_provider.dart';
import '../models/product_model.dart';
import '../../../core/utils/api_constants.dart';

class ProductService extends GetxService {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  // Future<List<ProductModel>> getProducts(String token) async {
  //   final response = await _apiProvider.get(
  //     ApiConstants.products,
  //     token: token,
  //   );
  //   return (response.data as List)
  //       .map((json) => ProductModel.fromJson(json))
  //       .toList();
  // }

  // Future<ProductModel> createProduct(ProductModel product, String token) async {
  //   final response = await _apiProvider.post(
  //     ApiConstants.products,
  //     product.toJson(),
  //     token: token,
  //   );
  //   return ProductModel.fromJson(response.data);
  // }

  // Future<ProductModel> updateProduct(
  //   String id,
  //   ProductModel product,
  //   String token,
  // ) async {
  //   final response = await _apiProvider.put(
  //     '${ApiConstants.products}/$id',
  //     product.toJson(),
  //     token: token,
  //   );
  //   return ProductModel.fromJson(response.data);
  // }

  // Future<void> deleteProduct(String id, String token) async {
  //   await _apiProvider.delete(
  //     '${ApiConstants.products}/$id',
  //     token: token,
  //   );
  // }
}