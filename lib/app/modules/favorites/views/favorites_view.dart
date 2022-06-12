import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FavoritesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FavoritesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
