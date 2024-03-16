import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/assets.dart';
import '../../../Models/banner.dart';

class BannerImageItem extends StatelessWidget {
  const BannerImageItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  final BannerResult item;
  final Function(int?) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CachedNetworkImage(
            imageUrl: item.posterPic ?? "",
            fit: BoxFit.fitWidth,
            height: 30.h,
            width: double.infinity,
            placeholder: (context, index) {
              return Image.asset(
                Assets.logoTransparent,
              );
            },
          ),
          Container(
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            ),
            // color: Colors.grey,
            width: double.infinity,

            padding: EdgeInsets.only(
              bottom: 0.7.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15.w,
                ),
                SizedBox(
                  width: 15.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: (item.hasRent ?? false)
                        ? const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.shop,
                          color: Colors.yellow,
                        )
                      ],
                    )
                        : Container(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
