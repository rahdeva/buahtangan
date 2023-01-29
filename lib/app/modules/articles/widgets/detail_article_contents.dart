import 'package:buahtangan/app/models/article.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:sizer/sizer.dart';

class DetailArticleContents extends StatelessWidget {
  const DetailArticleContents({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [dropShadow()],
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            article.title ?? "-",
            style: projectTextTheme.headline6?.copyWith(
              fontWeight: FontWeight.w600,
              color: onSurfaceColor
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Wrap(
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: [
              Text(
                article.author ?? "-",
                style: projectTextTheme.bodyText2!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: slate500
                ),
              ),
              CircleAvatar(
                radius: 2.5,
                backgroundColor: slate300,
              ),
              Text(
                article.publishedAt.toString(),
                style: projectTextTheme.bodyText2!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: slate500
                ),
              ),
              CircleAvatar(
                radius: 2.5,
                backgroundColor: slate300,
              ),
              Text(
                article.readTime ?? "-",
                style: projectTextTheme.bodyText2!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: slate500
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            article.content ?? "-",
            textAlign: TextAlign.justify,
            style: projectTextTheme.bodyText2!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: blackColor
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.thumb_up_outlined,
                    color: onSurfaceColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    article.likeCount.toString(),
                    style: projectTextTheme.caption!.copyWith(
                      color: onSurfaceColor
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    IconlyLight.chat,
                    color: onSurfaceColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    article.commentCount.toString(),
                    style: projectTextTheme.caption!.copyWith(
                      color: onSurfaceColor
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: (){},
                child: Image.asset(
                  "assets/images/ic_share.png",
                  width: 24,
                ),
              )
            ],
          )
        ]
      ), 
    );
  }
}