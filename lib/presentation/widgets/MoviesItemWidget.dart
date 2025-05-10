import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/data/api/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/models/movie_model.dart';

class MoviesItemView extends StatelessWidget{
  // debugPrint('imageUrl = : ' + item.posterPath.toString());
  double height = 280;
  double width = 200;

  MovieModel item;

  MoviesItemView(this.item);


  @override
  Widget build(BuildContext context) {
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
                  image: imageProvider,
                  fit: BoxFit.fitHeight,
                ),
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