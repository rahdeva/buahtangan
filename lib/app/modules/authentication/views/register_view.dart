import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: shadowDecoration(),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_left_rounded,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Container(
                      decoration: shadowDecoration(),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite_outline_rounded,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/register_controller.dart';

// class RegisterView extends GetView<RegisterController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('REGISTER'),
//         centerTitle: true,
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(20),
//         children: [
//           TextField(
//             controller: controller.nameC,
//             autocorrect: false,
//             decoration: InputDecoration(
//               labelText: "Name",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: controller.phoneC,
//             keyboardType: TextInputType.phone,
//             autocorrect: false,
//             decoration: InputDecoration(
//               labelText: "Phone",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: controller.emailC,
//             keyboardType: TextInputType.emailAddress,
//             autocorrect: false,
//             decoration: InputDecoration(
//               labelText: "Email",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 20),
//           Obx(
//             () => TextField(
//               obscureText: controller.isHidden.value,
//               controller: controller.passC,
//               autocorrect: false,
//               decoration: InputDecoration(
//                 labelText: "Password",
//                 border: OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                   onPressed: () => controller.isHidden.toggle(),
//                   icon: Icon(controller.isHidden.isTrue ? Icons.remove_red_eye : Icons.remove_red_eye_outlined),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Obx(
//             () => ElevatedButton(
//               onPressed: () {
//                 if (controller.isLoading.isFalse) {
//                   controller.register();
//                 }
//               },
//               child: Text(controller.isLoading.isFalse ? "REGISTER" : "LOADING..."),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
