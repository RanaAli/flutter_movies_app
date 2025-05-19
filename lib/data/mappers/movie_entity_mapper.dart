import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:movies_app/data/responses/movie_response.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

import 'movie_entity_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<MovieResponse, MovieEntity>(
    fields: [
      Field('adult', whenNull: false),
      Field('backdropPath', whenNull: ""),
      Field('genreIds', whenNull: <int>[]),
      Field('id', whenNull: -1),
      Field('originalLanguage', whenNull: ""),
      Field('originalTitle', whenNull: ""),
      Field('overview', whenNull: ""),
      Field('popularity', whenNull: -1),
      Field('posterPath', whenNull: ""),
      Field('releaseDate', whenNull: ""),
      Field('title', whenNull: ""),
      Field('video', whenNull: false),
      Field('voteAverage', whenNull: -1),
      Field('voteCount', whenNull: -1),
    ]
  )
])
class MovieEntityMapper extends $MovieEntityMapper {

}