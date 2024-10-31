import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../core/utils/api_constants.dart';

class ApiProvider extends GetConnect {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    validateStatus: (status) => status! < 500,
  ));

  // Future<Response> get(String path, {String? token}) async {
  //   try {
  //     final response = await _dio.get(
  //       path,
  //       options: Options(headers: ApiConstants.getHeaders(token: token)),
  //     );
  //     return _handleResponse(response);
  //   } on DioError catch (e) {
  //     throw _handleError(e);
  //   }
  // }

  // Future<Response> post(String path, dynamic data, {String? token}) async {
  //   try {
  //     final response = await _dio.post(
  //       path,
  //       data: data,
  //       options: Options(headers: ApiConstants.getHeaders(token: token)),
  //     );
  //     return _handleResponse(response);
  //   } on DioError catch (e) {
  //     throw _handleError(e);
  //   }
  // }

  // Future<Response> put(String path, dynamic data, {String? token}) async {
  //   try {
  //     final response = await _dio.put(
  //       path,
  //       data: data,
  //       options: Options(headers: ApiConstants.getHeaders(token: token)),
  //     );
  //     return _handleResponse(response);
  //   } on DioError catch (e) {
  //     throw _handleError(e);
  //   }
  // }

  // Future<Response> delete(String path, {String? token}) async {
  //   try {
  //     final response = await _dio.delete(
  //       path,
  //       options: Options(headers: ApiConstants.getHeaders(token: token)),
  //     );
  //     return _handleResponse(response);
  //   } on DioError catch (e) {
  //     throw _handleError(e);
  //   }
  // }

  // Response _handleResponse(Response response) {
  //   if (response.statusCode! >= 200 && response.statusCode! < 300) {
  //     return response;
  //   } else {
  //     throw Exception(response.data['message'] ?? 'Error occurred');
  //   }
  // }

  String _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return 'Connection timeout';
      case DioErrorType.receiveTimeout:
        return 'Receive timeout';
      case DioErrorType.sendTimeout:
        return 'Send timeout';
      case DioErrorType.badResponse:
        return error.response?.data['message'] ?? 'Bad response';
      default:
        return 'Something went wrong';
    }
  }
}