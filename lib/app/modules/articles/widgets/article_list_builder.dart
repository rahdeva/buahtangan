import 'package:buahtangan/app/models/article.dart';
import 'package:buahtangan/app/modules/articles/widgets/article_items.dart';
import 'package:flutter/material.dart';

class ListArticleBuilder extends StatelessWidget {
  const ListArticleBuilder(
    this.controller, {
    Key? key, 
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //     // itemCount: controller.dataList.length,
    //     itemCount: 10,
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     itemBuilder: (context, index) {
    //       return ArticleListItem(
    //         index: index,
    //         // mData: controller.dataList[index],
    //         controller: controller,
    //       );
    //     },
    //   );
    return StreamBuilder<List<Article>>(
      stream: controller.getArticles(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final article = snapshot.data!;
          return ListView.builder(
              itemCount: article.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ArticleListItem(
                  index: index,
                  mData: article[index],
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
