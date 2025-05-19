import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/app_ui_components/app_scaffold.dart';
import 'package:movies_app/presentation/popular_movies/cubit/popular_movies_cubit.dart';
import 'package:movies_app/presentation/popular_movies/cubit/popular_movies_state.dart';
import 'package:movies_app/presentation/popular_movies/widgets/movies_list_widget.dart';
import 'package:movies_app/routes/app_routes.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();

    context.read<PopularMoviesCubit>().getPopularMovie();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Popular Movies",
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
          builder: (context, state) {
            switch (state) {
              case PopularMoviesInitialState _:
                return const Center(child: CircularProgressIndicator());
              case PopularMoviesLoadingState _:
                return const Center(child: CircularProgressIndicator());
              case PopularMoviesLoadedState _:
                return MoviesListWidget(
                  data: state.data,
                  callback: (item) => navigateToMovieDetailsPage(context, item),
                );
              case PopularMoviesErrorState _:
                return Center(child: Text(state.error));
            }

            return const Center(child: Text("No Data"));
          },
        ),
      ),
    );
  }
}
