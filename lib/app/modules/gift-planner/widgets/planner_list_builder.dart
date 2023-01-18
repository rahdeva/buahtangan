import 'package:buahtangan/app/modules/articles/widgets/article_items.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_items.dart';
import 'package:flutter/material.dart';

class ListPlannerBuilder extends StatelessWidget {
  const ListPlannerBuilder(
    this.controller, {
    Key? key, 
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemCount: controller.dataList.length,
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return PlannerListItem(
            index: index,
            // mData: controller.dataList[index],
            controller: controller,
          );
        },
      );
  }
}
