import 'package:dio/dio.dart';
import 'package:movies_app/core/constants_methods.dart';
import 'package:movies_app/core/end_points.dart';
import 'package:movies_app/data/remote_data/data_providers/my_dio.dart';
import 'package:movies_app/data/remote_data/responses/tv_response.dart';

class TVRequest {
  Future tvRequest({required String apiKey}) async {
    try {
      Response response = await MyDio.getData(
          endPoint: popularTVShows, query: {'api_key': apiKey});
      printTest('tvResponse status code ${response.statusCode}');
      printResponse('tvResponse: ${response.data}');
      return TVResponse.fromJson(response.data);
    } catch (error) {
      printError("tvRequest: ${error.toString()}");
    }
  }
}
