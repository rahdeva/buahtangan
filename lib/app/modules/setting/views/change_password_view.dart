import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangePasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChangePasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
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

