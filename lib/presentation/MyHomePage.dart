import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_constants.dart';
import 'package:movies_app/data/api/api_service.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/popular_movies_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: _body());
  }

  FutureBuilder _body() {
    return FutureBuilder(
      future: getApiService().getPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final PopularMoviesModel data = snapshot.data!;
            return ListWidget(data: data);
          } else {
            return Text(snapshot.error.toString(),
                style: const TextStyle(color: Colors.red));
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({
    super.key,
    required this.data,
  });

  final PopularMoviesModel data;

  @override
  Widget build(BuildContext context) {
    var pageCount = data.page;
    var items = data.results!;

    return
        // Column(
        //   children: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text("Page = " + pageCount.toString()),
        //   ),
        //
        //   SizedBox(height: 8.0)

        GridView.builder(
      itemCount: items.length,
      // prototypeItem: moviesItemView(items.first),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 340),
      itemBuilder: (context, index) => moviesItemView(items[index]),
    );

    //   ],
    // );
  }

  Column moviesItemView(MovieModel item) {
    // debugPrint('imageUrl = : ' + item.posterPath.toString());
    double height = 280;
    double width = 200;

    return Column(
      children: [
        CachedNetworkImage(
          color: Colors.red,
          alignment: Alignment.topLeft,
          imageUrl: "https://image.tmdb.org/t/p/w500${item.posterPath}",
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider, fit: BoxFit.fitHeight),
              ),
            );
          },
          placeholder: (context, url) => SizedBox(
            height: height,
            width: width,
            child: const Center(child: CircularProgressIndicator()),
          ),
          errorWidget: (context, url, error) =>
              const Row(children: [Icon(Icons.error, size: 48.0)]),
          httpHeaders: const {
            ApiConstants.headerAuthorization: ApiConstants.headerToken
          },
          height: height,
          width: width,
        ),
        Text(item.title.toString()),
        Text(item.releaseDate.toString()),
      ],
    );
  }
}
