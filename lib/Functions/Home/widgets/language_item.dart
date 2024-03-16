
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Models/languages.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    super.key,
    required this.item,
    required this.onTap, required this.focusNode,
  });
  final FocusNode focusNode;
  final Language item;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: focusNode.hasFocus?10:4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //set border radius more than 50% of height and width to make circle
        ),
        child: focusNode.hasFocus?Container():Container(
          padding: EdgeInsets.only(
            right: 0.4.w,
          ),
          height: 11.h,
          width: 40.w,
          decoration: BoxDecoration(
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
    );
  }
}