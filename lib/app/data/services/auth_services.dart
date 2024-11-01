import 'package:get/get.dart';
import 'package:rimba_assesment/app/data/models/product_model.dart';
import 'package:rimba_assesment/app/data/models/profile_model.dart';
import 'package:rimba_assesment/app/data/models/response_model.dart';
import '../providers/api_provider.dart';
import '../../../core/utils/api_constants.dart';

class AuthService extends GetxService {
  final ApiProvider _apiProvider = Get.put(ApiProvider());

  // {
  //   if (data is Map<String, dynamic>) {
  //     return data;
  //   } else if (data is List) {
  //     return data;
  //   }
  //   return null;
  // },

  Future<ResponseModel?> register(dynamic body) async {
    final response = await _apiProvider.post(
      ApiConstants.baseUrl + ApiConstants.register,
      body,
    );
    if (response.body != null) {
      final data = ResponseModel<dynamic>.fromJson(
          response.body as Map<String, dynamic>, (data) => null);
      return data;
    } else {
      return null;
    }
  }

  Future<ResponseModel?> login(dynamic body) async {
    final response = await _apiProvider.post(
      ApiConstants.baseUrl + ApiConstants.login,
      body,
    );
    if (response.body != null) {
      final data = ResponseModel<dynamic>.fromJson(
          response.body as Map<String, dynamic>, (data) {
        if (data is Map<String, dynamic>) {
          return data;
        } else if (data is List) {
          return data;
        }
        return null;
      });
      return data;
    } else {
      return null;
    }
  }

  // Future<AuthModel> createAuth(AuthModel Auth, String token) async {
  //   final response = await _apiProvider.post(
  //     ApiConstants.Auths,
  //     Auth.toJson(),
  //     token: token,
  //   );
  //   return AuthModel.fromJson(response.data);
  // }

  // Future<AuthModel> updateAuth(
  //   String id,
  //   AuthModel Auth,
  //   String token,
  // ) async {
  //   final response = await _apiProvider.put(
  //     '${ApiConstants.Auths}/$id',
  //     Auth.toJson(),
  //     token: token,
  //   );
  //   return AuthModel.fromJson(response.data);
  // }

  // Future<void> deleteAuth(String id, String token) async {
  //   await _apiProvider.delete(
  //     '${ApiConstants.Auths}/$id',
  //     token: token,
  //   );
  // }
}
