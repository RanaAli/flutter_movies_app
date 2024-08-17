import 'package:dio/dio.dart';
import 'package:movies_app/data/api/api_constants.dart';
import 'package:movies_app/data/infrastructure/http_infra.dart';
import 'package:movies_app/data/models/popular_movies_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

ApiService getApiService(){
  return ApiService(getDio());
}

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.getPopularMovies)
  Future<PopularMoviesModel> getPopularMovies();
}
