import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio getDio() {
  final dioOptions = BaseOptions(contentType: "application/json");
  dioOptions.headers["Authorization"] =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YTcwM2UwZDBjNWQzZmVhNTM4YmEyMjU0NjMyMDBkMyIsInN1YiI6IjU3YmExMGQ1YzNhMzY4NDVkNTAwMWU0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Wj8VqhNq1_MJYwblRWyXovqxbPPhRksZPK5jUelBJI8";

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

  return dio;
}
