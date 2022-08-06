import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/text_theme.dart';

import '../controllers/gift_directory_controller.dart';

class GiftDirectoryView extends GetView<GiftDirectoryController> {
  const GiftDirectoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Container(
              width: Get.width,
              height: Get.height,
              padding: const EdgeInsets.all(24),
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
                children: [
                  Text(
                    "Gift Directory",
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    child: const Divider()
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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:myfirebase/app/routes/app_pages.dart';

// import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HOME'),
//         centerTitle: true,
//         actions: [
//           StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//             stream: controller.streamProfile(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircleAvatar(
//                   backgroundColor: Colors.grey[400],
//                 );
//               }
//               Map<String, dynamic>? data = snapshot.data!.data();

//               return GestureDetector(
//                 onTap: () => Get.toNamed(Routes.PROFILE),
//                 child: CircleAvatar(
//                   backgroundColor: Colors.grey[400],
//                   backgroundImage: NetworkImage(data?["profile"] != null ? data!["profile"] : "https://ui-avatars.com/api/?name=${data!["name"]}"),
//                 ),
//               );
//             },
//           ),
//           SizedBox(width: 20),
//         ],
//       ),
//       body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         stream: controller.streamNotes(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (snapshot.data?.docs.length == 0 || snapshot.data == null) {
//             return Center(
//               child: Text("Belum ada data notes."),
//             );
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               var docNote = snapshot.data!.docs[index];
//               Map<String, dynamic> note = docNote.data();
//               return ListTile(
//                 onTap: () => Get.toNamed(
//                   Routes.EDIT_NOTE,
//                   arguments: docNote.id,
//                 ),
//                 leading: CircleAvatar(
//                   child: Text("${index + 1}"),
//                 ),
//                 title: Text("${note['title']}"),
//                 subtitle: Text("${note['desc']}"),
//                 trailing: IconButton(
//                   onPressed: () {
//                     controller.deleteNote(docNote.id);
//                   },
//                   icon: Icon(Icons.delete),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Get.toNamed(Routes.ADD_NOTE),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }