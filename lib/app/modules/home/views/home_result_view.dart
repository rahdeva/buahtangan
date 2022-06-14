import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_result_controller.dart';

class HomeResultView extends GetView<HomeResultController> {
  const HomeResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeResultView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeResultView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
