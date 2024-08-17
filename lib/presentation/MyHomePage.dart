import 'package:flutter/material.dart';
import 'package:movies_app/data/api_service.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/data/models/popular_movies_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  final int counter = 0;

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
    final dioOptions = BaseOptions(contentType: "application/json");
    dioOptions.headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YTcwM2UwZDBjNWQzZmVhNTM4YmEyMjU0NjMyMDBkMyIsInN1YiI6IjU3YmExMGQ1YzNhMzY4NDVkNTAwMWU0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Wj8VqhNq1_MJYwblRWyXovqxbPPhRksZPK5jUelBJI8";
    final dio = Dio(dioOptions);
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));

    final apiService = ApiService(dio);
    return FutureBuilder(
      future: apiService.getPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final PopularMoviesModel data = snapshot.data!;
            return Text(data.page.toString());
          } else
            return Text(snapshot.error.toString());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
