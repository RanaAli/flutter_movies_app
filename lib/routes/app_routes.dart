import 'package:flutter/material.dart';
import 'package:movies_app/data/responses/movie_response.dart';
import 'package:movies_app/presentation/movie_details/movie_details_page.dart';

void navigateToMovieDetailsPage(BuildContext context, MovieResponse item) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => MovieDetailsPage(item),
    ),
  );
}
