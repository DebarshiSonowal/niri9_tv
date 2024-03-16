import 'package:flutter/material.dart';
import 'package:niri9_tv/Navigation/Navigate.dart';
import 'package:niri9_tv/Routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/assets.dart';
import '../../Repository/repository.dart';
import '../../Services/api_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),() async {
      await fetchCategories();
      Navigation.instance.navigateAndRemoveUntil(Routes.homeScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.red,
              child: Image.asset(
                Assets.logoTransparent,
                height: 15.h,
                width: 40.w,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> fetchCategories() async {
    final response = await ApiProvider.instance.getCategories();
    if (response.success ?? false) {
      Provider.of<Repository>(context, listen: false)
          .setCategories(response.categories);
    }
  }
}
