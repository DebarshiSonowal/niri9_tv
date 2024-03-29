import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niri9_tv/Functions/home/widgets/home_banner.dart';
import 'package:niri9_tv/Functions/home/widgets/language_section.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/assets.dart';
import '../../Constants/constants.dart';
import '../../Widgets/common_appbar.dart';
import 'widgets/dynamic_list_section_home.dart';
import 'widgets/recently_viewed_section.dart';
import 'widgets/title_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = true, isEnd = false;
  final ScrollController _scrollController = ScrollController();
  FocusNode _bannerFocusNode = FocusNode();
  FocusNode _languageSectionFocusNode = FocusNode();
  FocusNode _recentlyViewedFocusNode = FocusNode();
  FocusNode _dynamicListSection1FocusNode = FocusNode();
  final FocusNode _firstLanguageItemFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(6.h),
        child: CommonAppbar(
          title: "Home",
        ),
      ),
      body:  RawKeyboardListener(
        focusNode: FocusNode(), // Add a top-level FocusNode
        onKey: (RawKeyEvent event) {
          if (event is RawKeyDownEvent &&
              event.data is RawKeyEventDataAndroid) {
            RawKeyDownEvent rawKeyDownEvent = event;
            RawKeyEventData rawKeyEventDataAndroid = rawKeyDownEvent.data;
            debugPrint(
                "rawKeyDownEventDataAndroid ${rawKeyDownEvent.data.logicalKey
                    .hashCode}");
            switch (rawKeyDownEvent.data.logicalKey.hashCode) {
              case Constants.KEY_UP:
                _focusPreviousElement();
                break;
              case Constants.KEY_DOWN:
                _focusNextElement();
                break;
            // // ... add cases for other keys if needed
            }
          }
        },
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Focus(focusNode: _bannerFocusNode, child: const HomeBanner()),
                // HomeBanner(),
                TitleBox(
                  text: "Explore in your language",
                  onTap: () {},
                  isEnd: false,
                ),
                Focus(
                  focusNode: _languageSectionFocusNode,
                  child: LanguageSection(
                    languageSectionFocusNode:_languageSectionFocusNode,
                    firstLanguageItemFocusNode: _firstLanguageItemFocusNode,
                    scrollController: _scrollController,
                    onScroll: (UserScrollNotification notification) {},
                  ),
                ),
                // LanguageSection(
                //   firstLanguageItemFocusNode: _firstLanguageItemFocusNode,
                //   scrollController: _scrollController,
                //   onScroll: (UserScrollNotification notification) {},
                // ),
                // Focus(
                //   focusNode: _recentlyViewedFocusNode,
                //   child: const RecentlyViewedSection(),
                // ),
                Focus(
                  focusNode: _dynamicListSection1FocusNode,
                  child: const DynamicListSectionHome(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _focusNextElement() {
    debugPrint("Has234");
    // Logic to determine and shift focus to the next element based on current focus
    if (_bannerFocusNode.hasFocus) {
      FocusScope.of(context).requestFocus(_languageSectionFocusNode);
    } else if (_languageSectionFocusNode.hasFocus) {
      FocusScope.of(context).requestFocus(_recentlyViewedFocusNode);
    } // ... continue similar logic for other sections
  }

  void _focusPreviousElement() {
    // Similar logic, but in reverse for shifting focus to previous element
    if (_recentlyViewedFocusNode.hasFocus) {
      FocusScope.of(context).requestFocus(_languageSectionFocusNode);
    } else if (_languageSectionFocusNode.hasFocus) {
      FocusScope.of(context).requestFocus(_bannerFocusNode);
    } // ... continue similar logic for other sections
  }
}
