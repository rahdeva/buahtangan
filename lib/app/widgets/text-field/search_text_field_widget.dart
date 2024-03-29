// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:buahtangan/app/modules/articles/controllers/articles_controller.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    Key? key,
    required this.searchC,
    required this.hintText, 
    required this.controller,
  }) : super(key: key);

  final controller;
  final TextEditingController searchC;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [dropShadow()]
      ),
      child: TextField(
          controller: searchC,
          style: projectTextTheme.bodyText1!.copyWith(
            color: slate400
          ),
          decoration: InputDecoration(
            // labelText: labelText,
            hintText: hintText,
            hintStyle: projectTextTheme.bodyText1!.copyWith(
              color: slate400
            ),
            hoverColor: surfaceColor,
            fillColor: surfaceColor,
            focusColor: primaryColor,
            isDense: true,
            filled: true,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                IconlyLight.search,
                size: 24,
                color: slate400,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), 
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: primaryColor, width: 0.0)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: surfaceColor, width: 0.0)
            )
          ),
          textInputAction: TextInputAction.search,
          onChanged: (value) {
            controller.searchKeyword.value = value;
          },
        ),
      // ),
    );
  }
  
}
