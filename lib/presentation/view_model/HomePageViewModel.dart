import 'package:flutter/cupertino.dart';
import 'package:movies_app/data/infrastructure/result.dart';
import 'package:movies_app/data/models/popular_movies_model.dart';
import 'package:movies_app/domain/repositories/MoviesRepository.dart';

class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel(this._moviesRepo){
    getPopularMovie();
  }

  final MoviesRepository _moviesRepo;

  var loading = false;
  var error = "";
  PopularMoviesModel data = PopularMoviesModel();

  Future<void> getPopularMovie() async {
    loading = true;

    final result = await _moviesRepo.getPopularMovies();

    switch (result) {
      case Ok<PopularMoviesModel>():
        data = result.value;
      case Error<PopularMoviesModel>():
        error = result.error;
    }

    loading = false;
    notifyListeners();
  }
}
