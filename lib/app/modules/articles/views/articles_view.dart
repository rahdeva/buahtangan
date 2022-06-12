import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/articles_controller.dart';

class ArticlesView extends GetView<ArticlesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ArticlesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ArticlesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
