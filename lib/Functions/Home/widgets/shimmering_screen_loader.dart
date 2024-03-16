import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmeringWatchScreenLoader extends StatelessWidget {
  const ShimmeringWatchScreenLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: Colors.grey.shade800,
            child: Container(
              height: 30.h,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 2.h,
            ),
            height: 10.h,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.white30,
                  child: Container(
                    height: 2.h,
                    width: 30.w,
                    color: Colors.white30,
                  ),
                ),
                SizedBox(
                  height: 12.sp,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.white30,
                  child: Container(
                    height: 2.h,
                    width: 50.w,
                    color: Colors.white30,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white30,
            thickness: 0.1.h,
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.white54,
                  width: 0.03.h,
                ),
                bottom: BorderSide(
                  color: Colors.white54,
                  width: 0.03.h,
                ),
              ),
            ),
            height: 10.h,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 1.h,
                    ),
                    color: const Color(0xff2a2829),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.white30,
                              child: Icon(
                                Icons.share,
                                color: Colors.white30,
                                size: 22.sp,
                              ),
                            ),
                            SizedBox(
                              height: 1.2.h,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.white30,
                              child: Container(
                                height: 2.h,
                                width: 10.w,
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.white30,
                              child: Icon(
                                Icons.playlist_add,
                                color: Colors.white30,
                                size: 22.sp,
                              ),
                            ),
                            SizedBox(
                              height: 1.2.h,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.white30,
                              child: Container(
                                height: 2.h,
                                width: 10.w,
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.white30,
                              child: Icon(
                                Icons.money,
                                color: Colors.white30,
                                size: 22.sp,
                              ),
                            ),
                            SizedBox(
                              height: 1.2.h,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.white30,
                              child: Container(
                                height: 2.h,
                                width: 10.w,
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Colors.white30,
                          child: Icon(
                            Icons.play_circle_filled,
                            color: Colors.white30,
                            size: 22.sp,
                          ),
                        ),
                        SizedBox(
                          height: 1.2.h,
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Colors.white30,
                          child: Container(
                            height: 2.h,
                            width: 20.w,
                            color: Colors.white30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 1.h,
            ),
            child: Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.white30,
                  child: Container(
                    height: 1.5.h,
                    width: 15.w,
                    color: Colors.white30,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.white30,
                  child: Container(
                    height: 1.5.h,
                    width: 15.w,
                    color: Colors.white30,
                  ),
                ),
                const Spacer(),
                Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.white30,
                  child: Container(
                    height: 1.5.h,
                    width: 15.w,
                    color: Colors.white30,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.white30,
            child: Container(
              height: 5.h,
              width: 90.w,
              color: Colors.white30,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.white30,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white30,
                  size: 22.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.white30,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              height: 13.h,
              width: 90.w,
              color: Colors.white30,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          // SizedBox(
          //   height: 20.h,
          //   width: double.infinity,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         color: Colors.black,
          //         width: 10.w,
          //         height: 20.h,
          //       );
          //     },
          //     itemCount: 4,
          //   ),
          // ),
        ],
      ),
    );
  }
}