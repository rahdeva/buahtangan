import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/planner_people_detail_controller.dart';

class PlannerPeopleDetailView extends GetView<PlannerPeopleDetailController> {
  const PlannerPeopleDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlannerPeopleDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PlannerPeopleDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
