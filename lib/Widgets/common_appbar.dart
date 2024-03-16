import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Constants/assets.dart';

class CommonAppbar extends StatelessWidget {
  CommonAppbar({
    super.key, required this.title,this.starting,
  });
  final String title;
  double? starting;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: starting??3.w,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white,
            fontSize: 10.sp,
          ),
        ),
        const Spacer(),
        Image.asset(
          Assets.logo,
          scale: 20,
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: 3.w,
        ),
      ],
    );
  }
}