import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gift_directory_controller.dart';

class GiftDirectoryView extends GetView<GiftDirectoryController> {
  const GiftDirectoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GiftDirectoryView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'GiftDirectoryView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () => Get.toNamed(Routes.GIFT_DETAIL), 
              child: Text("Detail")
          )
        ],
      ),
    );
  }
}
