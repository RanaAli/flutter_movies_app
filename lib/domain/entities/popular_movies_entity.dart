import 'package:movies_app/data/responses/movie_response.dart';

class PopularMoviesEntity {
  int page;
  List<MovieResponse> results;
  int totalPages;
  int totalResults;

  PopularMoviesEntity({
    this.page = 0,
    this.results = const [],
    this.totalPages = 0,
    this.totalResults = 0
  });
}
