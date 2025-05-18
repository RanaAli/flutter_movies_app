import 'package:flutter/material.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/presentation/movie_details/movie_details_page.dart';

void navigateToMovieDetailsPage(BuildContext context, MovieModel item) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => MovieDetailsPage(item),
    ),
  );
}
