import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      )
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
