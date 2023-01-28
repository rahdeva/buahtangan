import 'package:buahtangan/app/models/planner.dart';
import 'package:buahtangan/app/modules/gift-planner/controllers/gift_planner_controller.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_items.dart';
import 'package:flutter/material.dart';

class ListPlannerBuilder extends StatelessWidget {
  const ListPlannerBuilder(
    this.controller, {
    Key? key, 
  }) : super(key: key);

  final GiftPlannerController controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Planner>>(
      stream: controller.getPlanner(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final planner = snapshot.data!;
          return ListView.builder(
            itemCount: planner.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return PlannerListItem(
                index: index,
                mData: planner[index],
                controller: controller,
              );
            },
          );
        } else{
          return const CircularProgressIndicator();
        }
      }
    );
  }
}
