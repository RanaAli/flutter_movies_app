import 'package:flutter/material.dart';
import 'package:movies_app/presentation/view_model/HomePageViewModel.dart';
import 'package:movies_app/presentation/widgets/ListWidget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Center(
            child:viewModel.loading
            ?  CircularProgressIndicator()
            : ListWidget(data: viewModel.data)
        )
    );
  }
}
