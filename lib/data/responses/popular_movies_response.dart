import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/data/responses/movie_response.dart';

part 'popular_movies_response.g.dart';

@JsonSerializable()
class PopularMoviesResponse {
  int? page;
  List<MovieResponse>? results;
  int? total_pages;
  int? total_results;

  PopularMoviesResponse({
    this.page,
    this.results,
    this.total_pages,
    this.total_results
  });

  factory PopularMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesResponseToJson(this);
}
