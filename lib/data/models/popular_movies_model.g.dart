// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoviesModel _$PopularMoviesModelFromJson(Map<String, dynamic> json) =>
    PopularMoviesModel(
      page: (json['page'] as num).toInt(),
      total_pages: (json['total_pages'] as num).toInt(),
      total_resultsl: (json['total_resultsl'] as num).toInt(),
    );

Map<String, dynamic> _$PopularMoviesModelToJson(PopularMoviesModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.total_pages,
      'total_resultsl': instance.total_resultsl,
    };
