import 'package:flutter/material.dart';

class AppAppBar extends AppBar {
  AppAppBar(BuildContext context, {String title = "", super.key})
      : super(
          title: Text(title),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        );
}
