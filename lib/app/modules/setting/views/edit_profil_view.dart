import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profil_controller.dart';

class EditProfilView extends GetView<EditProfilController> {
  const EditProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditProfilView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditProfilView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
