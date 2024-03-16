import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/assets.dart';
import '../../Navigation/Navigate.dart';
import '../../Widgets/common_appbar.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(7.h),
      //   child: SafeArea(
      //     child: AnimatedBackground(
      //       behaviour: RandomParticleBehaviour(
      //         options: ParticleOptions(
      //           spawnMaxRadius: 20.w,
      //           spawnMaxSpeed: 20.00,
      //           particleCount: 5,
      //           spawnMinSpeed: 10.00,
      //           minOpacity: 0.3,
      //           spawnOpacity: 0.4,
      //           image: Image.asset(Assets.logoTransparent),
      //         ),
      //       ),
      //       vsync: this,
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(
      //           horizontal: 3.w,
      //           // vertical: 0.5.h,
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Row(
      //               children: [
      //                 IconButton(
      //                   onPressed: () {
      //                     Navigation.instance.goBack();
      //                   },
      //                   icon: const Icon(
      //                     Icons.arrow_back,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(6.h),
        child: CommonAppbar(
          title: "Subscription",
          // starting: 20.w,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
