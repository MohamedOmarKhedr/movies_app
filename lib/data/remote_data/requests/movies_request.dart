import 'package:dio/dio.dart';
import 'package:movies_app/core/constants_methods.dart';
import 'package:movies_app/core/end_points.dart';
import 'package:movies_app/data/remote_data/data_providers/my_dio.dart';
import 'package:movies_app/data/remote_data/responses/movies_response.dart';

class MoviesRequest {
  Future moviesRequest({required String apiKey}) async {
    try {
      Response response = await MyDio.getData(
          endPoint: popularMovies, query: {'api_key': apiKey});
      printTest('moviesRequest status code ${response.statusCode}');
      printResponse('movieResponse: ${response.data}');
      return MoviesResponse.fromJson(response.data);
    } catch (error) {
      printError("moviesRequest: ${error.toString()}");
    }
    return null;
  }
}
