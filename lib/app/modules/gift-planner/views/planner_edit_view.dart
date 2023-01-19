import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/planner_edit_controller.dart';

class PlannerEditView extends GetView<PlannerEditController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlannerEditView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PlannerEditView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
