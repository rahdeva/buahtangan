import 'package:buahtangan/app/modules/articles/widgets/article_list_builder.dart';
import 'package:buahtangan/app/modules/gift-directory/widgets/gift_list_builder.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:buahtangan/app/widgets/text-field/search_text_field_widget.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';

import '../controllers/gift_directory_controller.dart';

class GiftDirectoryView extends GetView<GiftDirectoryController> {
  const GiftDirectoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                            "Discover gifts you might like",
                            style: projectTextTheme.subtitle2?.copyWith(
                              color: slate500,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          decoration: BoxDecoration(
                            color: surfaceColor,
                            boxShadow: [dropShadow()],
                            borderRadius: BorderRadius.circular(200)
                          ),
                          padding: const EdgeInsets.fromLTRB(12, 14, 12, 10),
                          child: Icon(
                            IconlyBold.heart,
                            size: 24,
                            color: secondaryVariantColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SearchTextFieldWidget(
                    // controller : controller,
                    searchC: controller.searchC, 
                    hintText: "Search an Article", 
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      Row(
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Icon(
                              IconlyLight.infoSquare,
                              color: onSurfaceColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: (){},
                            child: Icon(
                              Icons.grid_view_outlined,
                              color: onSurfaceColor,
                            ),
                          ),
                          // InkWell(
                          //   onTap: (){},
                          //   child: Icon(
                          //     Icons.format_list_bulleted_rounded,
                          //     color: onSurfaceColor,
                          //   ),
                          // ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Divider(color: slate400),
                  ListGiftBuilder(controller), 
                ]
              ),
            )
          ],
        ),
        ),
      ),
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