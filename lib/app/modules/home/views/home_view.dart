import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:buahtangan/app/widgets/logo-container/logo_image_container.dart';
import 'package:buahtangan/app/widgets/logo-container/logo_text_container.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.refreshPage,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LogoImageContainer(),
                    const LogoTextContainer(),
                    Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        boxShadow: [dropShadow()],
                        borderRadius: BorderRadius.circular(20)
                      ),
                      width: 100.w,
                      margin: const EdgeInsets.fromLTRB(40, 0, 50, 40),
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Text(
                            "We've your back",
                            style: projectTextTheme.subtitle1?.copyWith(color: slate500),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Try Out Our Gift Finder",
                            style: projectTextTheme.headline6?.copyWith(
                              color: onBackgroundColor,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: surfaceColor,
                          //     borderRadius: BorderRadius.circular(20),
                          //     boxShadow: [dropShadow()]
                          //   ),
                          //   child: SizedBox(
                          //     child: DropdownButtonFormField(
                          //         value: controller.selectedEvent,
                          //         items: controller.events.map((item) 
                          //           => DropdownMenuItem(
                          //             value: item,
                          //             child: Text(item)
                          //           )
                          //         ).toList(),
                          //         onChanged: (item) {
                          //           controller.selectedEvent = item.toString();
                          //         },
                          //       )
                          //     ),
                          // ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 16, top: 16),
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
                                contentPadding: const EdgeInsets.all(20), 
                                labelStyle: projectTextTheme.subtitle1?.copyWith(color: onSurfaceColor),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: primaryColor, width: 0.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: surfaceColor, width: 0.0)
                                ),
                              ),
                              value: "Event",
                              items: ["Event", 'bb', 'cc'].map((item) 
                                => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item)
                                  )
                                ).toList(),
                                onChanged: ((item) {
                                  item = item.toString();
                                })
                              ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
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
                                contentPadding: const EdgeInsets.all(20), 
                                labelStyle: projectTextTheme.subtitle1?.copyWith(color: onSurfaceColor),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: primaryColor, width: 0.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: surfaceColor, width: 0.0)
                                ),
                              ),
                              value: "Receiver",
                              items: ["Receiver", 'bb', 'cc'].map((item) 
                                => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item)
                                  )
                                ).toList(),
                                onChanged: ((item) {
                                  item = item.toString();
                                })
                              ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
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
                                contentPadding: const EdgeInsets.all(20), 
                                labelStyle: projectTextTheme.subtitle1?.copyWith(color: onSurfaceColor),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: primaryColor, width: 0.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: surfaceColor, width: 0.0)
                                ),
                              ),
                              value: "Budget",
                              items: ["Budget", 'bb', 'cc'].map((item) 
                                => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: projectTextTheme.subtitle1,
                                    )
                                  )
                                ).toList(),
                                onChanged: ((item) {
                                  item = item.toString();
                                })
                              ),
                          ), 
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            width: 100.w,
                            height: 60,
                            decoration: shadowDecoration(),
                            child: ElevatedButton(
                              onPressed: () => Get.toNamed(Routes.HOME_RESULT),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(secondaryColor),
                                overlayColor: MaterialStateProperty.all(secondaryVariantColor),
                                foregroundColor: MaterialStateProperty.all(onSecondaryColor),
                                shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                )),
                              ),
                              child: Text(
                                "Find It!",
                                style: projectTextTheme.button,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}


