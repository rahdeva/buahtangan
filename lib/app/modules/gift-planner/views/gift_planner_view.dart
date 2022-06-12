import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gift_planner_controller.dart';

class GiftPlannerView extends GetView<GiftPlannerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GiftPlannerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GiftPlannerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
