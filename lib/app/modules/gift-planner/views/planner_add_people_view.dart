import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/planner_add_people_controller.dart';

class PlannerAddPeopleView extends GetView<PlannerAddPeopleController> {
  const PlannerAddPeopleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlannerAddPeopleView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PlannerAddPeopleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
