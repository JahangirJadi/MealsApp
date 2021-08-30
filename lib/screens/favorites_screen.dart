import 'package:flutter/material.dart';
import '/widgets/main_drawer.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),

    );
  }
}
