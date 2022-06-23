import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/articles_controller.dart';

class ArticlesView extends GetView<ArticlesController> {
  ArticlesView({Key? key}) : super(key: key);

  String category = "Latest Tech";
  String title = "Immerse Project SIC Mobile Blog App";
  String author = "Jimmy Cool";
  String writtenDate = "14/02/2022";
  String articleImage =
      "https://images.unsplash.com/photo-1542435503-956c469947f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80";
  String userImage =
      "https://images.unsplash.com/photo-1495360010541-f48722b34f7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80";
  String articleContent =
      "Article ini adalah contoh article yang digunakan untuk mengembangkan aplikasi mobile dari SIC Blog. Adapun content dari article ini tidak ada isinya karena ini semua hanya untuk keperluan mengembangkan aplikasi blogapp.";
  String username = "User 1";
  String articleComment = "Article yang bagus!";
  int likeCount = 777;
  int dislikeCount = 123;
  int commentCount = 777;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [dropShadow()],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), 
                topRight: Radius.circular(30), 
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                    "Articles",
                      style: projectTextTheme.headline6?.copyWith(
                      color: onBackgroundColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                    "Discover things you don't know about",
                    style: projectTextTheme.subtitle2?.copyWith(
                      color: slate500,
                    ),
                  ),
                const SizedBox(height: 24),
                const Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(15.0),
                      onTap: () => Get.toNamed(Routes.ARTICLES_DETAIL),
                      child: Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(top: 24.0),
                        decoration: BoxDecoration(
                          color: surfaceColor,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [dropShadow()],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: Get.width <= 380 ? 130 : 150,
                              decoration: shadowDecoration(),
                              padding: const EdgeInsets.only(top:16.0, left: 16.0, bottom: 16.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                child: Image.network(articleImage)),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 8),
                                    Text(
                                      title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        fontSize: 16.0, 
                                        fontWeight: FontWeight.bold, 
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      "$author - $writtenDate",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ]
            ),
          )
        ),
      ),
    );
  }
}
