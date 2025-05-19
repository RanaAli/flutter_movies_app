

class MovieEntity {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieEntity({
    this.adult = false,
    this.backdropPath = "",
    this.genreIds = const <int>[],
    this.id = -1,
    this.originalLanguage = "",
    this.originalTitle = "",
    this.overview = "",
    this.popularity = -1,
    this.posterPath = "",
    this.releaseDate = "",
    this.title = "",
    this.video = false,
    this.voteAverage = -1,
    this.voteCount = -1,
  });

}
