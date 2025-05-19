import 'package:movies_app/data/infrastructure/result.dart';
import 'package:movies_app/data/responses/popular_movies_response.dart';

abstract class MoviesRepository {
  Future<Result<PopularMoviesResponse>> getPopularMovies();
}
