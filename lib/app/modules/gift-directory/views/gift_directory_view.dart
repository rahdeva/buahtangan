import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gift_directory_controller.dart';

class GiftDirectoryView extends GetView<GiftDirectoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GiftDirectoryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GiftDirectoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
