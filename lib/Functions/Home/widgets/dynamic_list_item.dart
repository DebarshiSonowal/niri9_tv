import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../Constants/common_functions.dart';
import '../../../Constants/constants.dart';
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
      {Key? key,
      required this.text,
      required this.list,
      required this.onTap,
      required this.focusNode,
      required this.focusNodes,
      required this.onUp,
      required this.onDown})
      : super(key: key);
  final String text;
  final List<Video> list;
  final Function onTap;
  final FocusNode focusNode;
  final List<FocusNode> focusNodes;
  final Function onUp, onDown;

  @override
  State<DynamicListItem> createState() => _DynamicListItemState();
}

class _DynamicListItemState extends State<DynamicListItem> {
  bool isEnd = false;
  int current = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: (val) {
        setState(() {});
      },
      child: SizedBox(
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
                decoration: BoxDecoration(
                  border: widget.focusNode.hasFocus
                      ? Border.all(color: Colors.blue, width: 2)
                      : null,
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
                  child: RawKeyboardListener(
                    focusNode: FocusNode(), // Add a top-level FocusNode
                    onKey: (RawKeyEvent event) {
                      if (event is RawKeyDownEvent &&
                          event.data is RawKeyEventDataAndroid) {
                        RawKeyDownEvent rawKeyDownEvent = event;
                        RawKeyEventData rawKeyEventDataAndroid =
                            rawKeyDownEvent.data;
                        debugPrint(
                            "rawKeyDownEventDataAndroid ${rawKeyDownEvent.data.logicalKey.hashCode}");
                        switch (rawKeyDownEvent.data.logicalKey.hashCode) {
                          case Constants.KEY_RIGHT:
                            if (current < widget.focusNodes.length) {
                              current++; // Update 'current' directly
                              FocusScope.of(context)
                                  .requestFocus(widget.focusNodes[current]);
                              setState(() {});
                              try {
                                Scrollable.ensureVisible(
                                  widget.focusNodes[current].context!,
                                  alignment: 0.5,
                                  // ... customization parameters ...
                                );
                              } catch (e) {
                                print(e);
                              }// Read the Repository
                            }
                            break;
                          case Constants.KEY_LEFT:
                            if (current > 0) {
                              current--; // Update 'current' directly
                              FocusScope.of(context)
                                  .requestFocus(widget.focusNodes[current]);

                              setState(() {});
                              try {
                                Scrollable.ensureVisible(
                                  widget.focusNodes[current].context!,
                                  alignment: 0.5,
                                  // ... customization parameters ...
                                );
                              } catch (e) {
                                print(e);
                              }
                            }
                            break;
                          case Constants.KEY_UP:
                            widget.onUp();
                            break;
                          case Constants.KEY_DOWN:
                            widget.onDown();
                            break;
                          // // ... add cases for other keys if needed
                        }
                      }
                    },
                    child: ListView.separated(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item = widget.list[index];
                        final focus = widget.focusNodes[index];
                        return OttItem(
                          item: item,
                          focus: focus,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
