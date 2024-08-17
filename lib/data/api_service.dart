import 'package:dio/dio.dart';
import 'package:movies_app/data/models/popular_movies_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/movie/popular')
  Future<PopularMoviesModel> getPopularMovies();
}