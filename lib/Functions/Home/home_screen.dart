import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niri9_tv/Functions/home/widgets/home_banner.dart';
import 'package:niri9_tv/Functions/home/widgets/language_section.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/assets.dart';
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
    return FocusableActionDetector(
      actions: {
        NextFocusAction: CallbackAction<NextFocusIntent>(
            onInvoke: (intent) => _focusNextElement()),
        PreviousFocusAction: CallbackAction<PreviousFocusIntent>(
            onInvoke: (intent) => _focusPreviousElement()),
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(6.h),
          child: CommonAppbar(
            title: "Home",
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Focus(focusNode: _bannerFocusNode, child: const HomeBanner()),
                TitleBox(
                  text: "Explore in your language",
                  onTap: () {},
                  isEnd: false,
                ),
                Focus(
                  focusNode: _languageSectionFocusNode,
                  child: LanguageSection(
                    firstLanguageItemFocusNode: _firstLanguageItemFocusNode,
                    scrollController: _scrollController,
                    onScroll: (UserScrollNotification notification) {},
                  ),
                ),
                Focus(
                  focusNode: _recentlyViewedFocusNode,
                  child: const RecentlyViewedSection(),
                ),
                Focus(
                  focusNode: _dynamicListSection1FocusNode,
                  child: const DynamicListSectionHome(),
                ),
              ],
            ),
          ),
          // color,
        ),
      ),
    );
  }

  void _focusNextElement() {
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
