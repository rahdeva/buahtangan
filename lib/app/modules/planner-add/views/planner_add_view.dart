import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/planner_add_controller.dart';

class PlannerAddView extends GetView<PlannerAddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlannerAddView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PlannerAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
