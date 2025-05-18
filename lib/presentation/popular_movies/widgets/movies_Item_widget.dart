import 'package:flutter/material.dart';
import 'package:movies_app/app_ui_components/movie_image_widget.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/theme/sizes.dart';

class MoviesItemView extends StatelessWidget {

  final MovieModel item;

  const MoviesItemView(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieImageWidget(item: item, height: thumbImageHeight, width: thumbImageWidth),
        Text(item.title.toString()),
        Text(item.releaseDate.toString()),
      ],
    );
  }
}


