import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/common_appbar.dart';
import 'widgets/trending_banner.dart';
import 'widgets/trending_dynamic_items.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool isEnd = false;
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(6.h),
        child: CommonAppbar(title: "Premium",),
      ),
      body: Container(
        height: 100.h,
        width:double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 0.5.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TrendingBanner(),
              SizedBox(
                height: 0.5.h,
              ),
              TrendingDynamicItems(page: page),
            ],
          ),
        ),
      ),
    );
  }
}
