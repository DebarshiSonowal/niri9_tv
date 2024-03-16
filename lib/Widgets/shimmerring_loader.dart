import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerLanguageScreen extends StatelessWidget {
  const ShimmerLanguageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 2.h,
      ),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.white70,
              child: Container(
                color: Colors.white30,
                width: 20.w,
                height: 2.h,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 25.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.white70,
                    child: Container(
                      height: 20.h,
                      width: 40.w,
                      color: Colors.white30,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 2.h,
                  );
                },
                itemCount: 4,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.white70,
              child: Container(
                color: Colors.white30,
                width: 20.w,
                height: 2.h,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 25.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.white70,
                    child: Container(
                      height: 20.h,
                      width: 40.w,
                      color: Colors.white30,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 2.h,
                  );
                },
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}