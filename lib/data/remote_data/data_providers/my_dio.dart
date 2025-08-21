import 'package:dio/dio.dart';
import 'package:movies_app/core/constants.dart';

class MyDio {
  static Dio? dio;

  static dioInit() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }

  static Future<Response> getData(
      {required String endPoint, Map<String, dynamic>? query}) async {
    return await dio!.get(endPoint, queryParameters: query);
  }

  static Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data}) async {
    // حاجة ثابتة بتتعمل دائما مع البوست وأحيانا ينبعت في ال هيدرز التويكن وأحيانا اللغة
    dio!.options.headers = {'Content-Type': 'application/json'};
    return await dio!.post(endPoint, queryParameters: query, data: data);
  }
}
