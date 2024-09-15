import 'package:dio/dio.dart';
import 'package:store_app/core/networking/api_constants.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);
  Future<List<dynamic>> getAllProducts() async {
    try {
      Response response =
          await _dio.get('${ApiConstants.apiBaseUrl}${ApiConstants.products}');
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
