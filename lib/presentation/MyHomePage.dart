import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/api_service.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/data/models/popular_movies_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      maxWidth: 90,
      enabled: kDebugMode,
    ));
 
    final apiService = ApiService(dio);
    return FutureBuilder(
      future: apiService.getPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final PopularMoviesModel data = snapshot.data!;
            return ListWidget(data: data);
          } else
            return Text(snapshot.error.toString(), style: TextStyle(color: Colors.red));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({
    super.key,
    required this.data,
  });

  final PopularMoviesModel data;

  @override
  Widget build(BuildContext context) {
    return Text(data.page.toString());
  }
}
