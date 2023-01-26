import 'package:buahtangan/app/models/gift.dart';
import 'package:buahtangan/app/widgets/snackbar/show_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GiftDirectoryController extends GetxController {
  static GiftDirectoryController find = Get.find();
  TextEditingController searchC = TextEditingController();
  RefreshController refreshController = RefreshController(initialRefresh: false);

  void refreshPage() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  Stream<List<Gift>> getGifts() {
    return FirebaseFirestore.instance
      .collection('gifts')
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map(
          (doc) => Gift.fromJson(doc.data())
        ).toList()
      );
  }

  Future createNewGift() async {
    const slug = "test-gift";
    final docGift = FirebaseFirestore.instance
      .collection("gifts")
      .doc(slug);
    final gift = Gift(
      id: 1, 
      createdAt: DateTime.now(), 
      slug: slug, 
      pictureUrl: "https://picsum.photos/400/400", 
      title: "Gift Test", 
      description: "Test Description", 
      type: "Experiental", 
      category: [
        "Art & Decor",
        "Personal Care"
      ],
      budgetRange: "100.000-1.000.000", 
      suitableEvent: [
        "Valentine",
        "Christmas"
      ],
      suitableReceiver: [
        "Her",
        "Him",
        "Couple"
      ],
      howToGet: HowToGet(
        offlineStoreText: "", 
        onlineStoreSpecialUrl: "", 
        shopeeUrl: "", 
        tokopediaUrl: "", 
        youtubeTutorialUrl: "", 
        tutorialArticleSlug: ""
      ),
      likeCount: 200, 
      commentCount: 200, 
      comments: [
        Comment(
          userName: "John Doe", 
          comment: "John Doe", 
          date: DateTime.now(),
        )
      ]
    );

    final json = gift.toJson();
    await docGift.set(json);
    showSnackbar(
      "Work!", "Work!",
      const Icon(Icons.close_rounded, color: Colors.red)
    );
  }

  Future updateGift() async {
    const slug = "test-gift";
    final docGift = FirebaseFirestore.instance
      .collection("gifts")
      .doc(slug);
    final gift = Gift(
      id: 1, 
      createdAt: DateTime.now(), 
      slug: slug, 
      pictureUrl: "https://picsum.photos/400/400", 
      title: "Gift Update", 
      description: "Test Description", 
      type: "Experiental", 
      category: [
        "Art & Decor",
        "Personal Care"
      ],
      budgetRange: "100.000-1.000.000", 
      suitableEvent: [
        "Valentine",
        "Christmas"
      ],
      suitableReceiver: [
        "Her",
        "Him",
        "Couple"
      ],
      howToGet: HowToGet(
        offlineStoreText: "", 
        onlineStoreSpecialUrl: "", 
        shopeeUrl: "", 
        tokopediaUrl: "", 
        youtubeTutorialUrl: "", 
        tutorialArticleSlug: ""
      ),
      likeCount: 200, 
      commentCount: 200, 
      comments: [
        Comment(
          userName: "John Doe", 
          comment: "John Doe", 
          date: DateTime.now(),
        )
      ]
    );

    final json = gift.toJson();
    await docGift.update(json);
    showSnackbar(
      "Work!", "Work!",
      const Icon(Icons.close_rounded, color: Colors.red)
    );
  }

  Future deleteGift() async {
    const slug = "test-gift";
    final docGift = FirebaseFirestore.instance
      .collection("gifts")
      .doc(slug);
    await docGift.delete();
    showSnackbar(
      "Work!", "Work!",
      const Icon(Icons.close_rounded, color: Colors.red)
    );
  }
}
