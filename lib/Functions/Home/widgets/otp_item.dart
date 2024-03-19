import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import 'package:niri9/Models/movies.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/assets.dart';
import '../../../Models/ott.dart';
import '../../../Models/video.dart';

class OttItem extends StatelessWidget {
  const OttItem({
    super.key,
    required this.item,
    required this.onTap,this.onLongPressed, required this.focus,
  });

  final Video item;
  final Function onTap;
  final Function? onLongPressed;
  final FocusNode focus;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      onLongPress: ()=>onLongPressed!(),
      child: Card(
        elevation: focus.hasFocus? 10:4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          width: 34.w,
          decoration: BoxDecoration(
            // color: Colors.red,
            border: focus.hasFocus ? Border.all(color: Colors.blue, width: 2) : null,
            borderRadius: BorderRadius.circular(5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: item.profile_pic!,
              // // width: 22.w,
              // width: 20.w,
              // height: 16.h,
              fit: BoxFit.fill,
              placeholder: (context, index) {
                return Image.asset(
                  Assets.logoTransparent,
                ).animate();
              },
            ),
          ),
        ),
      ),
    );
  }
}
