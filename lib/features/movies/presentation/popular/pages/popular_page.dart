import 'package:carnagef_alpha/features/movies/presentation/popular/getx/popular_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularPage extends GetView<PopularController> {

  static const String routeName = '/popular-page';
  const PopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(controller.title),
      ),
      body: Container() // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
