import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:buahtangan/app/widgets/text-field/search_text_field_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/color_theme.dart';
import '../../../themes/text_theme.dart';

import '../controllers/articles_controller.dart';

class ArticlesView extends GetView<ArticlesController> {
  const ArticlesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
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
                        margin: const EdgeInsets.only(top: 16.0),
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
                              // decoration: shadowDecoration(),
                              padding: const EdgeInsets.only(top:16.0, left: 16.0, bottom: 16.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                child: Image.network(controller.articleImage)),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 8),
                                    Text(
                                      controller.title,
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
                                      "${controller.author} - ${controller.writtenDate}",
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
