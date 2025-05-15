import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/infrastructure/result.dart';
import 'package:movies_app/data/models/popular_movies_model.dart';
import 'package:movies_app/domain/repositories/MoviesRepository.dart';
import 'package:movies_app/presentation/home_page/cubit/popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final MoviesRepository _moviesRepo;

  PopularMoviesCubit(this._moviesRepo) : super(PopularMoviesInitialState());

  Future<void> getPopularMovie() async {
    emit(PopularMoviesLoadingState());

    try {
      final result = await _moviesRepo.getPopularMovies();

      switch (result) {
        case Ok<PopularMoviesModel>():
          emit(PopularMoviesLoadedState(result.value));
        case Error<PopularMoviesModel>():
          emit(PopularMoviesErrorState(result.error));
      }
    } on Exception catch (e) {
      emit(PopularMoviesErrorState(e.toString()));
    }
  }
}
