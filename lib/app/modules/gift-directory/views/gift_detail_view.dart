import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gift_detail_controller.dart';

class GiftDetailView extends GetView<GiftDetailController> {
  const GiftDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GiftDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GiftDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
