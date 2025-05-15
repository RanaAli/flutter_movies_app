import 'package:flutter/material.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/popular_movies_model.dart';
import 'package:movies_app/presentation/popular_movies/widgets/movies_Item_widget.dart';

class MoviesListWidget extends StatelessWidget {
  MoviesListWidget({super.key, required this.data, this.callback});

  PopularMoviesModel data;
  Function(MovieModel)? callback;

  @override
  Widget build(BuildContext context) {
    var pageCount = data.page;
    var items = data.results;

    return GridView.builder(
      itemCount: items?.length ?? 0,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 340,
      ),
      itemBuilder: (context, index) => items == null
          ? Center(child: Text("Null"))
          : InkWell(
              splashColor: Colors.grey,
              onTap: () {
                callback?.call(items[index]);
              },
              child: MoviesItemView(items[index]),
            ),
    );
  }
}
