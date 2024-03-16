import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../Constants/common_functions.dart';
import '../../../Models/ott.dart';
import '../../../Models/video.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Repository/repository.dart';
import '../../../Routes/routes.dart';
import '../../../Storage/storage.dart';
import 'otp_item.dart';
import 'title_box.dart';

class DynamicListItem extends StatefulWidget {
  const DynamicListItem(
      {Key? key, required this.text, required this.list, required this.onTap})
      : super(key: key);
  final String text;
  final List<Video> list;
  final Function onTap;

  @override
  State<DynamicListItem> createState() => _DynamicListItemState();
}

class _DynamicListItemState extends State<DynamicListItem> {
  bool isEnd = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleBox(
              isEnd: isEnd,
              text: widget.text,
              onTap: () => widget.onTap(),
            ),
            Container(
              // color: Colors.green,
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 1.h,
              ),
              height: 25.h,
              width: double.infinity,
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  final ScrollMetrics metrics = notification.metrics;

                  if (direction == ScrollDirection.forward &&
                      metrics.pixels > 0) {
                    // Slight swipe to the right
                    setState(() {
                      isEnd = false;
                    });
                  } else if (direction == ScrollDirection.reverse &&
                      metrics.pixels < metrics.maxScrollExtent) {
                    // Slight swipe to the left

                    setState(() {
                      isEnd = true;
                    });
                  }

                  return true;
                },
                child: ListView.separated(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = widget.list[index];
                    return OttItem(
                      item: item,
                      onTap: () {
                        if (Storage.instance.isLoggedIn) {
                          // Navigation.instance
                          //     .navigate(Routes.watchScreen, args: item.id);
                        } else {
                          // CommonFunctions().showLoginSheet(context);
                          // CommonFunctions().showLoginDialog(context);
                        }
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 2.w,
                    );
                  },
                  itemCount: widget.list.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
