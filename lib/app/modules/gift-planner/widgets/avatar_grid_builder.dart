import 'package:buahtangan/app/models/avatar.dart';
import 'package:buahtangan/app/modules/gift-planner/controllers/planner_add_controller.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/avatar_grid_items.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AvatarGridBuilder extends StatelessWidget {
  const AvatarGridBuilder(
    this.controller, {
    Key? key, 
  }) : super(key: key);

  final PlannerAddController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Avatar>>(
      future: controller.getAvatars(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final avatarList = snapshot.data!;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              // mainAxisExtent: 280,
            ),
            itemCount: avatarList.length,
            itemBuilder: (context, index) {
              return index == 0 
              ? Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/img_add_image.png",
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                    boxShadow: [dropShadow()]
                  ),
                )
              : AvatarGridItem(
                  index: index,
                  mData: avatarList[index],
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
