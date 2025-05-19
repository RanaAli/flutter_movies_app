import 'package:dio/dio.dart';
import 'package:movies_app/data/api/api_constants.dart';
import 'package:movies_app/data/infrastructure/http_infra.dart';
import 'package:movies_app/data/infrastructure/result.dart';
import 'package:movies_app/data/responses/popular_movies_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:movies_app/data/infrastructure/api_call_adapter.dart';

part 'api_service.g.dart';

ApiService getApiService(){
  return ApiService(getDio());
}

@RestApi(baseUrl: ApiConstants.baseUrl, callAdapter: ApiCallAdapter)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.getPopularMovies)
  Future<Result<PopularMoviesResponse>> getPopularMovies();
}
