import 'package:movies_app/data/infrastructure/result.dart';
import 'package:movies_app/data/responses/popular_movies_response.dart';
import 'package:movies_app/domain/entities/popular_movies_entity.dart';

abstract class MoviesRepository {
  Future<Result<PopularMoviesEntity>> getPopularMovies();
}
