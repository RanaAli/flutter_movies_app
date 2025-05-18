import 'package:flutter/material.dart';
import 'package:movies_app/app_ui_components/app_app_bar.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const AppScaffold({this.title = "", required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(context, title: title),
      body: body,
    );
  }
}
