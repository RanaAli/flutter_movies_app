import 'package:movies_app/data/infrastructure/result.dart';
import 'package:movies_app/data/models/popular_movies_model.dart';

abstract class MoviesRepository {
  Future<Result<PopularMoviesModel>> getPopularMovies();
}
