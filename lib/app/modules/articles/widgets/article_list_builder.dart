import 'package:buahtangan/app/models/article.dart';
import 'package:buahtangan/app/modules/articles/controllers/articles_controller.dart';
import 'package:buahtangan/app/modules/articles/widgets/article_items.dart';
import 'package:flutter/material.dart';

class ListArticleBuilder extends StatelessWidget {
  const ListArticleBuilder(
    this.controller, {
    Key? key, 
  }) : super(key: key);

  final ArticlesController controller;

  @override
  Widget build(BuildContext context) {
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
