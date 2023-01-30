import 'package:buahtangan/app/models/article.dart';
import 'package:buahtangan/app/modules/articles/controllers/articles_detail_controller.dart';
import 'package:buahtangan/app/modules/articles/widgets/comment_items.dart';
import 'package:flutter/material.dart';

class ListCommentBuilder extends StatelessWidget {
  const ListCommentBuilder({
    Key? key, 
    required this.controller, 
    required this.comments,
  }) : super(key: key);

  final ArticlesDetailController controller;
  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CommentListItem(
          index: index,
          mData: comments[index],
          controller: controller,
        );
      },
    );
  }
}
