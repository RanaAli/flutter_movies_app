import 'package:json_annotation/json_annotation.dart';

part 'popular_movies_model.g.dart';

@JsonSerializable()
class PopularMoviesModel {
  int? page;
  int? total_pages;
  int? total_results;

  PopularMoviesModel({
    this.page,
    this.total_pages,
    this.total_results
  });

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesModelToJson(this);
}
