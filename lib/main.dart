import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_service.dart';
import 'package:movies_app/data/repositories/MoviesRepositoryRemote.dart';
import 'package:movies_app/presentation/home_page/MyHomePage.dart';
import 'package:movies_app/presentation/home_page/view_model/HomePageViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                HomePageViewModel(MoviesRepositoryRemote(getApiService())))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
