// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../core/utils/api_constants.dart';

class ApiProvider extends GetConnect {
  final dio.Dio _dio = dio.Dio(dio.BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    validateStatus: (status) => status! < 500,
  ));

  Future<dio.Response<dynamic>> GET(String path, {String? token}) async {
    try {
      final response = await _dio.get(
        path,
        options: dio.Options(headers: ApiConstants.getHeaders(token: token)),
      );
      return _handleResponse(response);
    } on dio.DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dio.Response<dynamic>> POST(String path, dynamic data, {String? token}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: dio.Options(headers: ApiConstants.getHeaders(token: token)),
      );
      return _handleResponse(response);
    } on dio.DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dio.Response<dynamic>> PUT(String path, dynamic data, {String? token}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        options: dio.Options(headers: ApiConstants.getHeaders(token: token)),
      );
      return _handleResponse(response);
    } on dio.DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dio.Response<dynamic>> DELETE(String path, {String? token}) async {
    try {
      final response = await _dio.delete(
        path,
        options: dio.Options(headers: ApiConstants.getHeaders(token: token)),
      );
      return _handleResponse(response);
    } on dio.DioException catch (e) {
      throw _handleError(e);
    }
  }

  dio.Response<dynamic> _handleResponse(dio.Response<dynamic> response) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response;
    } else {
      throw Exception(response.data['message'] ?? 'Error occurred');
    }
  }

  String _handleError(dio.DioException error) {
    switch (error.type) {
      case dio.DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case dio.DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case dio.DioExceptionType.sendTimeout:
        return 'Send timeout';
      case dio.DioExceptionType.badResponse:
        return error.response?.data['message'] ?? 'Bad response';
      default:
        return 'Something went wrong';
    }
  }
}
