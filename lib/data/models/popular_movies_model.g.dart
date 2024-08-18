// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoviesModel _$PopularMoviesModelFromJson(Map<String, dynamic> json) =>
    PopularMoviesModel(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_pages: (json['total_pages'] as num?)?.toInt(),
      total_results: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PopularMoviesModelToJson(PopularMoviesModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };
