import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_service.dart';
import 'package:movies_app/data/models/popular_movies_model.dart';
import 'package:movies_app/presentation/widgets/ListWidget.dart';

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
      body: _body(),
    );
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
            return Text(
              snapshot.error.toString(),
              style: const TextStyle(color: Colors.red),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}


