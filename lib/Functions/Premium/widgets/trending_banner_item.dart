import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/common_functions.dart';
// import '../../../Helper/storage.dart';
import '../../../Models/banner.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Routes/routes.dart';
import '../../../Storage/storage.dart';
import 'trending_banner.dart';
// import '../../../Router/routes.dart';
// import '../../HomeScreen/Widgets/play_button_now.dart';

class TrendingBannerItem extends StatelessWidget {
  const TrendingBannerItem({
    super.key,
    required this.item,
  });

  final BannerResult item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CachedNetworkImage(
            imageUrl: item.posterPic ?? "",
            fit: BoxFit.fitWidth,
            height: 30.h,
            width: double.infinity,
          ),
          // Container(
          //   height: 7.h,
          //   decoration: BoxDecoration(
          //     color: Colors.black.withOpacity(0.2),
          //   ),
          //   // color: Colors.grey,
          //   width: double.infinity,
          //
          //   padding: EdgeInsets.only(
          //     bottom: 0.7.h,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       GestureDetector(
          //         onTap:(){
          //           if (Storage.instance.isLoggedIn) {
          //             // Navigation.instance
          //             //     .navigate(Routes.watchScreen, args: item.id);
          //           } else {
          //             CommonFunctions().showLoginDialog(context);
          //           }
          //         },
          //         child: const PlayNowButton(),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}