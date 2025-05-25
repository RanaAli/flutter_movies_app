import 'package:flutter/material.dart';
import 'package:movies_app/data/responses/movie_response.dart';
import 'package:movies_app/domain/entities/popular_movies_entity.dart';
import 'package:movies_app/presentation/popular_movies/widgets/movie_Item_widget.dart';

class MoviesListWidget extends StatelessWidget {
  MoviesListWidget({super.key, required this.data, this.callback});

  PopularMoviesEntity data;
  Function(MovieResponse)? callback;

  @override
  Widget build(BuildContext context) {
    var pageCount = data.page;
    var items = data.results;

    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 340,
      ),
      itemBuilder: (context, index) => InkWell(
        splashColor: Theme.of(context).colorScheme.primary,
        onTap: () {
          callback?.call(items[index]);
        },
        child: MovieItemView(items[index]),
      ),
    );
  }
}
