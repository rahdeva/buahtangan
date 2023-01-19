import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/planner_detail_controller.dart';

class PlannerDetailView extends GetView<PlannerDetailController> {
  const PlannerDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlannerDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PlannerDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
