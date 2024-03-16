import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/assets.dart';
import '../../Constants/constants.dart';
import '../../Widgets/common_appbar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(6.h),
        child: CommonAppbar(
          title: "About",
          // starting: 20.w,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "About",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              Constants.about ?? "",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white70,
              ),
            ),
            const Spacer(),
            Image.asset(
              Assets.logoTransparent,
              height: 15.h,
              width: 30.w,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
