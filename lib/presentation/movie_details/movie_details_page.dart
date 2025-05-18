import 'package:flutter/material.dart';
import 'package:movies_app/app_ui_components/app_scaffold.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "Movie Details page",
        body: Center(child: Text("Movie Details")));
  }
}
