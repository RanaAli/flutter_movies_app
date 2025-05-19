import 'package:movies_app/data/api/api_service.dart';
import 'package:movies_app/data/infrastructure/result.dart';
import 'package:movies_app/data/mappers/popular_movies_entity_mapper.dart';
import 'package:movies_app/data/responses/popular_movies_response.dart';
import 'package:movies_app/domain/entities/popular_movies_entity.dart';
import 'package:movies_app/domain/repositories/MoviesRepository.dart';

class MoviesRepositoryRemote extends MoviesRepository {
  final ApiService service;

  MoviesRepositoryRemote(this.service);

  @override
  Future<Result<PopularMoviesEntity>> getPopularMovies() async {
    final response = await service.getPopularMovies();

    switch (response) {
      case Ok<PopularMoviesResponse>():
        return Result.ok(PopularMoviesEntityMapper().convert(response.value));
      case Error<PopularMoviesResponse>():
        return Result.error(response.error);
    }
  }
}
