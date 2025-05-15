import 'package:movies_app/data/models/popular_movies_model.dart';

abstract class PopularMoviesState {}

class PopularMoviesInitialState extends PopularMoviesState {}

class PopularMoviesLoadingState extends PopularMoviesState {}

class PopularMoviesLoadedState extends PopularMoviesState {
  final PopularMoviesModel data;

  PopularMoviesLoadedState(this.data);
}

class PopularMoviesErrorState extends PopularMoviesState {
  final String error;

  PopularMoviesErrorState(this.error);
}
