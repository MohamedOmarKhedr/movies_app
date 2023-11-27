import 'package:dio/dio.dart';
import 'package:movies_app/core/constants_methods.dart';
import 'package:movies_app/core/end_points.dart';
import 'package:movies_app/data/remote_data/data_providers/my_dio.dart';
import 'package:movies_app/data/remote_data/responses/stars_response.dart';

class StarsRequest {
  Future starsRequest({required String apiKey}) async {
    try {
      Response response = await MyDio.getData(
          endPoint: popularStars, query: {'api_key': apiKey});
      printTest('StarsResponse status code ${response.statusCode}');
      printResponse('StarsResponse: ${response.data}');
      return StarsResponse.fromJson(response.data);
    } catch (error) {
      printError("starsRequest: ${error.toString()}");
    }
  }
}
