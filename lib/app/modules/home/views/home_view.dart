import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var controller = Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    print("home");
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: shadowDecoration(),
              margin: const EdgeInsets.fromLTRB(25,25,25,0),
              child: Center(
                child: CircleAvatar(
                  radius: 120,
                  backgroundColor: backgroundColor,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: backgroundColor,
                    child: Image.asset("assets/images/imagesLogo.png"),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                boxShadow: [dropShadow()],
                borderRadius: BorderRadius.circular(20)
              ),
              margin: const EdgeInsets.all(24.0),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Image.asset(
                "assets/images/textLogo.png",
                width: Get.width * 0.5,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                boxShadow: [dropShadow()],
                borderRadius: BorderRadius.circular(20)
              ),
              width: Get.width,
              margin: const EdgeInsets.fromLTRB(40, 0, 50, 40),
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    "We've your back",
                    style: projectTextTheme.subtitle1?.copyWith(color: slate500),
                  ),
                  const SizedBox(height: 16),
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
                      value: "aa",
                      items: ["aa", 'bb', 'cc'].map((item) 
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
                      value: "aa",
                      items: ["aa", 'bb', 'cc'].map((item) 
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
                      value: "aa",
                      items: ["aa", 'bb', 'cc'].map((item) 
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
                    margin: const EdgeInsets.only(top: 24),
                    width: Get.width,
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
    );
  }
}
