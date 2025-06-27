import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
    if (response.statusCode! >= 400 && response.statusCode! < 500) {
      throw ClientAdminError(message: ShowNotices.usersError);
    } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
      throw ClientAdminError(message: ShowNotices.serverError);
    }

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
    if (response.statusCode! >= 400 && response.statusCode! < 500) {
      throw ClientAdminError(message: ShowNotices.usersError);
    } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
      throw ClientAdminError(message: ShowNotices.serverError);
    }

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
    if (response.statusCode! >= 400 && response.statusCode! < 500) {
      throw ClientAdminError(message: ShowNotices.usersError);
    } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
      throw ClientAdminError(message: ShowNotices.serverError);
    }

    return response.data;
  }
}
