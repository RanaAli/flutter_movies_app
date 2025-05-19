import 'package:flutter/material.dart';
import 'package:movies_app/app_ui_components/movie_image_widget.dart';
import 'package:movies_app/data/responses/movie_response.dart';
import 'package:movies_app/theme/sizes.dart';
import 'package:movies_app/theme/app_text_styles.dart';

class MovieItemView extends StatelessWidget {
  final MovieResponse item;

  const MovieItemView(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieImageWidget(
            item: item, height: thumbImageHeight, width: thumbImageWidth),
        Text(item.title.toString(), style: AppTextStyles.title),
        Text(item.releaseDate.toString(), style: AppTextStyles.body),
      ],
    );
  }
}
