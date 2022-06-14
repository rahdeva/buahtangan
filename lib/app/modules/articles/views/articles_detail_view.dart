import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/articles_detail_controller.dart';

class ArticlesDetailView extends GetView<ArticlesDetailController> {
  const ArticlesDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ArticlesDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ArticlesDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
