import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_service.dart';
import 'package:movies_app/data/repositories/MoviesRepositoryRemote.dart';
import 'package:movies_app/presentation/popular_movies/popular_movies_page.dart';
import 'package:movies_app/presentation/popular_movies/cubit/popular_movies_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MoviesRepositoryRemote(getApiService()),
      child: BlocProvider(
        create: (context) => PopularMoviesCubit(
            RepositoryProvider.of<MoviesRepositoryRemote>(context)),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const PopularMoviesPage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }

}
