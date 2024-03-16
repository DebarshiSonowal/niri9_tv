import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/cli_commands.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/constants.dart';
import '../../../Navigation/Navigate.dart';

class CategorySpecificAppbar extends StatelessWidget {
  const CategorySpecificAppbar({
    super.key,
    required this.searchTerm,
  });

  final String searchTerm;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 3.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigation.instance.goBack();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.white,
                    size: 14.sp,
                  ),
                ),
                // SizedBox(
                //   width: 5.w,
                // ),
                Text(
                  searchTerm,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 15.sp,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}