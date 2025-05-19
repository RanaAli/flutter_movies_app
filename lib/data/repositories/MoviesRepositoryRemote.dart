import 'package:movies_app/data/api/api_service.dart';
import 'package:movies_app/data/infrastructure/result.dart';
import 'package:movies_app/data/responses/popular_movies_response.dart';
import 'package:movies_app/domain/repositories/MoviesRepository.dart';

class MoviesRepositoryRemote extends MoviesRepository {
  final ApiService service;

  MoviesRepositoryRemote(this.service);

  @override
  Future<Result<PopularMoviesResponse>> getPopularMovies() {
    return service.getPopularMovies();
  }
}
