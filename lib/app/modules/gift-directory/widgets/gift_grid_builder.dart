import 'package:buahtangan/app/modules/gift-directory/widgets/gift_grid_items.dart';
import 'package:buahtangan/app/modules/gift-directory/widgets/gift_list_items.dart';
import 'package:flutter/material.dart';

class GridGiftBuilder extends StatelessWidget {
  const GridGiftBuilder(
    this.controller, {
    Key? key, 
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 280,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return GiftGridItem(
          index: index,
          // mData: controller.dataList[index],
          controller: controller,
        );
      },
    );
  }
}
