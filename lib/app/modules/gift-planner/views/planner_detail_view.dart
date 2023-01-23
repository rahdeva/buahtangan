import 'package:buahtangan/app/models/planner.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_disable_text_field_widget.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_text_field_widget.dart';
import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:buahtangan/app/widgets/button/back_button.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';

import '../controllers/planner_detail_controller.dart';

class PlannerDetailView extends StatelessWidget {
  const PlannerDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlannerDetailController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.refreshPage,
              child: SingleChildScrollView(
                child: FutureBuilder<Planner?>(
                  future: controller.getPlannerDetail(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      final planner = snapshot.data!.plannerData?[controller.id-1];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const BackAndEditButton(),
                          Container(
                              width: 100.w,
                              constraints: BoxConstraints(minHeight: 90.h),
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                boxShadow: [dropShadow()],
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30), 
                                  topRight: Radius.circular(30), 
                                )
                              ),
                              padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PlannerPictureAndReceiverWidget(planner: planner),
                                  const SizedBox(height: 24),
                                  Text(
                                    "Date",
                                    style: projectTextTheme.subtitle1?.copyWith(
                                      color: onSurfaceColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.testC,
                                    keyboardType: TextInputType.name,
                                    hintText: "Date",
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Event",
                                    style: projectTextTheme.subtitle1?.copyWith(
                                      color: onSurfaceColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.testC,
                                    keyboardType: TextInputType.name,
                                    hintText: "Event",
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Budget",
                                    style: projectTextTheme.subtitle1?.copyWith(
                                      color: onSurfaceColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.testC,
                                    keyboardType: TextInputType.name,
                                    hintText: "Budget",
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Messages",
                                    style: projectTextTheme.subtitle1?.copyWith(
                                      color: onSurfaceColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.testC,
                                    keyboardType: TextInputType.name,
                                    hintText: "Messages",
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Notes",
                                    style: projectTextTheme.subtitle1?.copyWith(
                                      color: onSurfaceColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.testC,
                                    keyboardType: TextInputType.name,
                                    hintText: "Notes",
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Notification",
                                    style: projectTextTheme.subtitle1?.copyWith(
                                      color: onSurfaceColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.testC,
                                    keyboardType: TextInputType.name,
                                    hintText: "Notification",
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Gift List",
                                    style: projectTextTheme.subtitle1?.copyWith(
                                      color: onSurfaceColor,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const EmptyGiftListWidget(),
                                ]
                              ),
                          )
                        ],
                      );
                    }
                    else{
                      return const CircularProgressIndicator();
                    }
                  }
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

class PlannerPrimaryButton extends StatelessWidget {
  const PlannerPrimaryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: tertiaryColor,
          boxShadow: [dropShadow()],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: onSurfaceColor
            ),
            const SizedBox(width: 8),
            Text(
              "Add Receiver",
              style: projectTextTheme.button!.copyWith(
                color: onSurfaceColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddGiftFromDirectoryButton extends StatelessWidget {
  const AddGiftFromDirectoryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: slate500,
          boxShadow: [dropShadow()],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.add,
              color: surfaceColor
            ),
            const SizedBox(width: 8),
            Text(
              "Add gift from directory",
              style: projectTextTheme.bodyText2!.copyWith(
                color: surfaceColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddGiftFromFavoritesButton extends StatelessWidget {
  const AddGiftFromFavoritesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: slate500,
          boxShadow: [dropShadow()],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.add,
              color: surfaceColor
            ),
            const SizedBox(width: 8),
            Text(
              "Add gift from favorites",
              style: projectTextTheme.bodyText2!.copyWith(
                color: surfaceColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlannerPictureAndReceiverWidget extends StatelessWidget {
  const PlannerPictureAndReceiverWidget({
    Key? key,
    required this.planner,
  }) : super(key: key);

  final PlannerData? planner;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            boxShadow: [dropShadow()],
            borderRadius: BorderRadius.circular(15),
          ),
          child: CachedNetworkImage(
            imageUrl: planner?.pictureUrl ?? "",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Image.asset(
              "assets/images/img_square_placeholder.png",
              fit: BoxFit.cover,
            )
          ),
        ),
        const SizedBox(width: 24),
        SizedBox(
          width: 100.w - 100 - 48 - 24,
          child: Text(
            planner?.receiver ?? "-",
            style: projectTextTheme.subtitle1!.copyWith(
              color: onSurfaceColor
            ),
          ),
        ),
      ],
    );
  }
}

class BackAndEditButton extends StatelessWidget {
  const BackAndEditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackButtonWidget(),
        InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: (){
            Get.toNamed(
              Routes.PLANNER_ADD
            );
          },
          child: Container(
            margin: const EdgeInsets.all(24.0),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: secondaryColor,
              boxShadow: [dropShadow()],
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: [
                Icon(
                  Icons.edit,
                  color: onSecondaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  "Edit",
                  style: projectTextTheme.subtitle2?.copyWith(
                    color: onSecondaryColor
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class EmptyGiftListWidget extends StatelessWidget {
  const EmptyGiftListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/ic_empty_box.png"
        ),
        const SizedBox(width: 16),
        Text(
          "No gifts have been added yet",
          style: projectTextTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.w500,
            color: slate500,
          ),
        ),
      ],
    );
  }
}
