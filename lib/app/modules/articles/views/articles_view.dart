import 'package:buahtangan/app/modules/articles/widgets/article_list_builder.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:buahtangan/app/widgets/text-field/search_text_field_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/color_theme.dart';
import '../../../themes/text_theme.dart';

import '../controllers/articles_controller.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticlesController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.refreshPage,
              child: SingleChildScrollView(
                child: Container(
                  width: 100.w,
                  constraints: BoxConstraints(minHeight: 90.h),
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
                      const SizedBox(height: 16),
                      SearchTextFieldWidget(
                        // controller : controller,
                        searchC: controller.searchC, 
                        hintText: "Search an Article", 
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Sort by",
                            style: projectTextTheme.bodyText2?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: onSurfaceColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 160,
                            decoration: BoxDecoration(
                              color: surfaceColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [dropShadow()]
                            ),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                hoverColor: surfaceColor,
                                fillColor: surfaceColor,
                                focusColor: primaryColor,
                                isDense: true,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4), 
                                labelStyle: projectTextTheme.caption?.copyWith(color: slate500),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: primaryColor, width: 0.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: surfaceColor, width: 0.0)
                                ),
                              ),
                              value: "Newest",
                              items: ["Newest", 'bb', 'cc'].map((item) 
                                => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: projectTextTheme.caption?.copyWith(color: slate500),
                                    )
                                  )
                                ).toList(),
                                onChanged: ((item) {
                                  item = item.toString();
                                })
                              ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Divider(color: slate400),
                      ListArticleBuilder(controller), 
                    ]
                  ),
                )
              ),
            ),
            floatingActionButton: Container(
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      controller.createNewArticle();
                    }, 
                    icon: Icon(Icons.add)
                  ),
                  IconButton(
                    onPressed: (){
                      controller.updatePlanner();
                    }, 
                    icon: Icon(Icons.edit)
                  ),
                  IconButton(
                    onPressed: (){
                      
                    }, 
                    icon: Icon(Icons.delete)
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          ),
        );
      }
    );
  }
}
