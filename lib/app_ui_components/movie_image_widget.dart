import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_constants.dart';
import 'package:movies_app/data/responses/movie_response.dart';

class MovieImageWidget extends StatelessWidget {
  const MovieImageWidget({
    super.key,
    required this.item,
    required this.height,
    required this.width,
  });

  final MovieResponse item;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      color: Colors.red,
      alignment: Alignment.topLeft,
      imageUrl: "https://image.tmdb.org/t/p/w500${item.posterPath}",
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight),
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
    );
  }
}
