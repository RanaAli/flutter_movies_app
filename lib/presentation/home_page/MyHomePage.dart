import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/home_page/cubit/popular_movies_cubit.dart';
import 'package:movies_app/presentation/home_page/cubit/popular_movies_state.dart';
import 'package:movies_app/presentation/home_page/widgets/ListWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();

    context.read<PopularMoviesCubit>().getPopularMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
        builder: (context, state) {
          switch (state) {
            case PopularMoviesInitialState _:
              return const Center(child: CircularProgressIndicator());
            case PopularMoviesLoadingState _:
              return const Center(child: CircularProgressIndicator());
            case PopularMoviesLoadedState _:
              return ListWidget(data: state.data);
            case PopularMoviesErrorState _:
              return Center(child: Text(state.error));
          }

          return const Center(child: Text("No Data"));
        },
      ),
    );
  }

}
