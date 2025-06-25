import 'package:dio/dio.dart';

class Apis {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> post(
    String url,
    FormData data,
    String header,
  ) async {
    final response = await _dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'ar',
          if (header.isNotEmpty) 'Authorization': 'Bearer $header',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> get(
    String url,
    Map<String, dynamic> data,
    String header,
  ) async {
    final response = await _dio.get(
      url,
      data: data,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'ar',
          if (header.isNotEmpty) 'Authorization': 'Bearer $header',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> delet(
    String url,
    Map<String, dynamic> data,
    String header,
  ) async {
    final response = await _dio.delete(
      url,
      data: data,
      options: Options(
        validateStatus: (status) => status! >= 200,
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'ar',
          if (header.isNotEmpty) 'Authorization': 'Bearer $header',
        },
      ),
    );

    return response.data;
  }
}
