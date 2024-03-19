
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Models/languages.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    super.key,
    required this.item,
    required this.onTap,
    required this.focusNode,
    required this.isFocused,
  });
  final FocusNode focusNode;
  final Language item;
  final Function onTap;
  final bool isFocused;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Select language: ${item.name}', // Announce language name
      button: true,
      onTapHint: 'Tap to select ${item.name}',
      child: GestureDetector(
        onTap: () => onTap(),
        child: Card(
          elevation: focusNode.hasFocus?10:4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            //set border radius more than 50% of height and width to make circle
          ),
          child:Container(
            padding: EdgeInsets.only(
              right: 0.4.w,
            ),
            height: 11.h,
            width: 40.w,
            decoration: BoxDecoration(
              border: focusNode.hasFocus ? Border.all(color: Colors.blue, width: 2) : null,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: CachedNetworkImageProvider(
                  item.profile_pic ?? "",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}