import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/constants.dart';

// import '../Constants/constants.dart';

class TitleBox extends StatelessWidget {
  const TitleBox({
    super.key, this.text, required this.onTap, required this.isEnd,
  });
  final String? text;
  final Function onTap;
  final bool isEnd;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
      ),
      width: double.infinity,
      height: 6.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text??""),
          isEnd?GestureDetector(
            onTap: ()=>onTap(),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Constants.thirdColor,
            ),
          ):Container(),
        ],
      ),
    );
  }
}