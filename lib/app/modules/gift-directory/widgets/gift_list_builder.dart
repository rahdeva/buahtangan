import 'package:buahtangan/app/modules/gift-directory/widgets/gift_list_items.dart';
import 'package:flutter/material.dart';

class ListGiftBuilder extends StatelessWidget {
  const ListGiftBuilder(
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
          return GiftListItem(
            index: index,
            // mData: controller.dataList[index],
            controller: controller,
          );
        },
      );
  }
}
