import 'package:buahtangan/app/models/article.dart';
import 'package:buahtangan/app/modules/articles/widgets/comment_list_builder.dart';
import 'package:buahtangan/app/modules/articles/widgets/detail_article_contents.dart';
import 'package:buahtangan/app/modules/articles/widgets/detail_article_picture.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/text_theme.dart';
import '../../../widgets/button/back_button.dart';

import '../controllers/articles_detail_controller.dart';

class ArticlesDetailView extends StatelessWidget {
  const ArticlesDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticlesDetailController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.refreshPage,
              child: SingleChildScrollView(
                child: FutureBuilder<Article?>(
                  future: controller.getArticleDetail(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      final article = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const BackButtonWidget(),
                          Container(
                            width: 100.w,
                            constraints: BoxConstraints(minHeight: 90.h),
                            decoration: BoxDecoration(
                              color: backgroundColor, 
                              boxShadow: [dropShadow()],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30), 
                                topRight: Radius.circular(30), 
                              )
                            ),
                            padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                            child: SafeArea(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DetailArticlePicture(article: article),
                                  const SizedBox(height: 24),
                                  DetailArticleContents(article: article),
                                  const SizedBox(height: 24),
                                  Container(
                                    width: 100.w,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Comments",
                                      style: projectTextTheme.headline6!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: onBackgroundColor
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      color: backgroundColor,
                                      boxShadow: [dropShadow()],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: ListTile(
                                      leading: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Icon(
                                          IconlyLight.chat,
                                          color: slate500,
                                        ),
                                      ),
                                      title: TextField(
                                        decoration: const InputDecoration(
                                          hintText: "Add Comment",
                                        ),
                                        style: projectTextTheme.caption!.copyWith(
                                          color: slate500
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.send,
                                        color: slate500,
                                      ),
                                    ),
                                  ),
                                  ListCommentBuilder(
                                    controller: controller,
                                    comments: article.comments ?? []
                                  ),
                                ]
                              )
                            ),
                          ),
                        ],
                      );
                    }
                    else{
                      return const CircularProgressIndicator();
                    }
                  }
                ),
              ),
            ),
          )
        );
      }
    );
  }
}