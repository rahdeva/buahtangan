import 'package:buahtangan/app/models/gift.dart';
import 'package:buahtangan/app/modules/gift-directory/controllers/gift_directory_controller.dart';
import 'package:buahtangan/app/modules/gift-directory/widgets/gift_grid_items.dart';
import 'package:buahtangan/app/modules/gift-directory/widgets/gift_list_items.dart';
import 'package:flutter/material.dart';

class GridGiftBuilder extends StatelessWidget {
  const GridGiftBuilder(
    this.controller, {
    Key? key, 
  }) : super(key: key);

  final GiftDirectoryController controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Gift>>(
      stream: controller.getGifts(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final gift = snapshot.data!;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 280,
            ),
            itemCount: gift.length,
            itemBuilder: (context, index) {
              return GiftGridItem(
                index: index,
                mData: gift[index],
                controller: controller,
              );
            },
          );
        } else{
          return const CircularProgressIndicator();
        }
      }
    );
  }
}
