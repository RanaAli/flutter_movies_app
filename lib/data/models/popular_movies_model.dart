import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/data/models/movie_model.dart';

part 'popular_movies_model.g.dart';

@JsonSerializable()
class PopularMoviesModel {
  int? page;
  List<MovieModel>? movies;
  int? total_pages;
  int? total_results;

  PopularMoviesModel({
    this.page,
    this.movies,
    this.total_pages,
    this.total_results
  });

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesModelToJson(this);
}
