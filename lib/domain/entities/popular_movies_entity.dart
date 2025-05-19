import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/data/responses/movie_response.dart';

class PopularMoviesEntity {
  int page;
  List<MovieResponse> results;
  int total_pages;
  int total_results;

  PopularMoviesEntity({
    this.page = 0,
    this.results = const [],
    this.total_pages = 0,
    this.total_results = 0
  });
}
