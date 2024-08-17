import 'package:json_annotation/json_annotation.dart';

part 'popular_movies_model.g.dart';

@JsonSerializable()
class PopularMoviesModel {
  int page;
  int total_pages;
  int total_resultsl;

  PopularMoviesModel({
    required this.page,
    required this.total_pages,
    required this.total_resultsl
  });

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesModelToJson(this);
}
