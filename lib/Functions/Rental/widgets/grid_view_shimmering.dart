import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class GridViewShimmering extends StatelessWidget {
  const GridViewShimmering({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 1.5.w,
        mainAxisSpacing: 1.h,
        childAspectRatio: 6.5 / 8.5,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.white70,
          child: Container(
            // height: 5.h,
            // width: 10.w,
            color: Colors.white30,
          ),
        );
      },
    );
  }
}