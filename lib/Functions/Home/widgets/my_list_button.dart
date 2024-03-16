import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyListButton extends StatelessWidget {
  const MyListButton({
    super.key,
    required this.onTap, required this.hasMyList,
  });
  final bool hasMyList;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: SizedBox(
        width: 15.w,
        height: 5.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              !hasMyList?Icons.add:Icons.remove,
              size: 16.sp,
              color: Colors.white,
            ),
            Text(
              "My List",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
                fontSize: 9.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}