import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/constants.dart';
import '../../../Repository/repository.dart';
import '../../home/widgets/language_item.dart';

class LanguageSectionMain extends StatefulWidget {
  const LanguageSectionMain({
    super.key,
    required this.scrollController,
    required this.onScroll,
    required this.firstLanguageItemFocusNode,
    required this.focusedNode, required this.languageSectionFocusNode,
  });

  final ScrollController scrollController;
  final Function(UserScrollNotification notification) onScroll;
  final FocusNode firstLanguageItemFocusNode,languageSectionFocusNode;
  final List<FocusNode> focusedNode;

  @override
  State<LanguageSectionMain> createState() => _LanguageSectionMainState();
}

class _LanguageSectionMainState extends State<LanguageSectionMain> {
  int current = 0;
  Repository? data;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      data = Provider.of<Repository>(context, listen: false);
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<Repository>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      width: double.infinity,
      height: 11.h,
      child: RawKeyboardListener(
        focusNode: FocusNode(), // Add a top-level FocusNode
        onKey: (RawKeyEvent event) {
          if (event is RawKeyDownEvent &&
              event.data is RawKeyEventDataAndroid && widget.languageSectionFocusNode.hasFocus) {
            RawKeyDownEvent rawKeyDownEvent = event;
            RawKeyEventData rawKeyEventDataAndroid = rawKeyDownEvent.data;
            debugPrint(
                "rawKeyDownEventDataAndroid ${rawKeyDownEvent.data.logicalKey
                    .hashCode}");
            switch (rawKeyDownEvent.data.logicalKey.hashCode) {
              case Constants.KEY_LEFT:
                if (current < widget.focusedNode.length) {
                  current++; // Update 'current' directly
                  FocusScope.of(context).requestFocus(widget.focusedNode[current]);
                  setState(() {}); // Read the Repository
                }
                break;
              case Constants.KEY_RIGHT:
                if (current>0) {
                  current--; // Update 'current' directly
                  FocusScope.of(context).requestFocus(widget.focusedNode[current]);
                  setState(() {});
                }
                break;
            // // ... add cases for other keys if needed
            }
          }
        },
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            widget.onScroll(notification);
            return true;
          },
          child: ListView.separated(
            controller: widget.scrollController,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var item = data?.languages[index];
              // var item = data.languages[index];
              final bool isFocused = index == current;
              final focusNode = widget.focusedNode[index];
              // index == 1 ? widget.firstLanguageItemFocusNode : FocusNode();
              return Focus(
                // Wrap in Focus widget
                focusNode: focusNode,
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    debugPrint("Focus Changed $index $current}");
                    Provider.of<Repository>(context, listen: false)
                        .updateLanguageFocused(index);
                    setState(() {

                    });
                    // setState(() {
                    //   current = index;
                    // });
                    // Or update your state variable
                  }
                },
                child: LanguageItem(
                  focusNode: focusNode,
                  isFocused: isFocused,
                  item: item!,
                  onTap: () {
                    // Navigation.instance.navigate(
                    //     Routes.selectedLanguageScreen,
                    //     args: "${item.id},${item.slug}");
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 2.w,
              );
            },
            itemCount: data?.languages.length??0,
          ),
        ),
      ),
    );
  }

  void _focusNextElement(data) {
    debugPrint("Clicked it");
    final currentFocus = FocusScope
        .of(context)
        .focusedChild;
    int newIndex =
        (Provider
            .of<Repository>(context, listen: false)
            .focusedLanguageIndex +
            1) %
            Provider
                .of<Repository>(context, listen: false)
                .languages
                .length;
    Provider.of<Repository>(context, listen: false)
        .updateLanguageFocused(newIndex);
    currentFocus?.unfocus();
    FocusScope.of(context).requestFocus(data.languages[newIndex].focusNode);
  }

  void _focusPreviousElement(data) {
    debugPrint("Clicked it");
    final currentFocus = FocusScope
        .of(context)
        .focusedChild;
    int newIndex = (Provider
        .of<Repository>(context, listen: false)
        .focusedLanguageIndex -
        1)
        .clamp(
        0,
        Provider
            .of<Repository>(context, listen: false)
            .languages
            .length -
            1);
    Provider.of<Repository>(context, listen: false)
        .updateLanguageFocused(newIndex);
    currentFocus?.unfocus();
    FocusScope.of(context).requestFocus(data.languages[newIndex].focusNode);
  }
}
