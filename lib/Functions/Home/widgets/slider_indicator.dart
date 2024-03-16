import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../Repository/repository.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({
    super.key,
    required int current,
  }) : _current = current;

  final int _current;

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(
        builder: (context,data,index) {
          return SizedBox(
            height: 0.3.h,
            width: 50.w,
            child: Center(
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 5.w,
                    height: 1.h,
                    decoration: BoxDecoration(
                      color: _current == index
                          ? Colors.white
                          : Colors.grey.withOpacity(0.8),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: 2.w,
                  );
                },
                itemCount: data.homeBanner.length,
              ),
            ),
          );
        }
    );
  }
}