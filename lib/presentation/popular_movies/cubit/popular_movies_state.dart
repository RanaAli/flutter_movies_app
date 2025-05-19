import 'package:movies_app/data/responses/popular_movies_response.dart';

abstract class PopularMoviesState {}

class PopularMoviesInitialState extends PopularMoviesState {}

class PopularMoviesLoadingState extends PopularMoviesState {}

class PopularMoviesLoadedState extends PopularMoviesState {
  final PopularMoviesResponse data;

  PopularMoviesLoadedState(this.data);
}

class PopularMoviesErrorState extends PopularMoviesState {
  final String error;

  PopularMoviesErrorState(this.error);
}
