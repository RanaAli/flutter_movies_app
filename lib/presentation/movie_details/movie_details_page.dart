import 'package:flutter/material.dart';
import 'package:movies_app/app_ui_components/app_scaffold.dart';
import 'package:movies_app/app_ui_components/movie_image_widget.dart';
import 'package:movies_app/data/responses/movie_response.dart';
import 'package:movies_app/theme/sizes.dart';

class MovieDetailsPage extends StatelessWidget {
  final MovieResponse item;

  const MovieDetailsPage(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: item.title ?? "Movie Details",
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieImageWidget(
                item: item,
                height: thumbImageHeight,
                width: thumbImageWidth,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ifNotNull(item.title),
                  _ifNotNull(item.releaseDate),
                  _ifNotNull(item.popularity),
                  _ifNotNull(item.voteAverage),

                  if (item.adult != null && item.adult! == true) Text("18+"),
                ],
              )
            ],
          ),
          if (item.overview != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Overview"),
                Text(item.overview.toString()),
              ],
            )
        ],
      ),
    );
  }
}

Widget _ifNotNull<T>(T? value) {
  if (value != null) {
    return Text(value.toString());
  } else {
    return Container();
  }
}
