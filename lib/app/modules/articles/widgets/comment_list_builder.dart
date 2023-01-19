import 'package:buahtangan/app/modules/gift-directory/widgets/comment_items.dart';
import 'package:buahtangan/app/modules/gift-directory/widgets/gift_list_items.dart';
import 'package:flutter/material.dart';

class ListCommentBuilder extends StatelessWidget {
  const ListCommentBuilder(
    this.controller, {
    Key? key, 
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemCount: controller.dataList.length,
        itemCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CommentListItem(
            index: index,
            // mData: controller.dataList[index],
            controller: controller,
          );
        },
      );
  }
}
