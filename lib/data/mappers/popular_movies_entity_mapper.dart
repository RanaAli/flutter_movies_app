import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:movies_app/data/responses/popular_movies_response.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/popular_movies_entity.dart';

import 'popular_movies_entity_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<PopularMoviesResponse, PopularMoviesEntity>(
    fields: [
      Field('page', whenNull: -1),
      Field('results', whenNull: <MovieEntity>[]),
      Field('totalPages', whenNull: -1),
      Field('totalResults', whenNull: -1),
    ],
  )
])
class PopularMoviesEntityMapper extends $PopularMoviesEntityMapper {}
