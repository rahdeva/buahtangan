import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:buahtangan/app/widgets/back_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const BackButtonWidget(),
            Container(
                width: Get.width,
                height: Get.height,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  boxShadow: [dropShadow()],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30), 
                    topRight: Radius.circular(30), 
                  )
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(40, 60, 40, 28),
                      child: Text(
                        "Change Password",
                        style: projectTextTheme.headline6?.copyWith(
                          color: onBackgroundColor
                        ),
                      ),
                    ),
                  ]
                ),
            )
          ],
        ),
      )),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/reset_password_controller.dart';

// class ResetPasswordView extends GetView<ResetPasswordController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('RESET PASSWORD'),
//         centerTitle: true,
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(20),
//         children: [
//           TextField(
//             controller: controller.emailC,
//             autocorrect: false,
//             decoration: InputDecoration(
//               labelText: "Email",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 20),
//           Obx(
//             () => ElevatedButton(
//               onPressed: () {
//                 if (controller.isLoading.isFalse) {
//                   controller.reset();
//                 }
//               },
//               child: Text(controller.isLoading.isFalse ? "RESET" : "LOADING..."),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

