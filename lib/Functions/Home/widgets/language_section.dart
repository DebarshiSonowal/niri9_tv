import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

// import 'package:niri9/Models/available_language.dart';
// import 'package:niri9/Navigation/Navigate.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

// import '../../../API/api_provider.dart';
import '../../../Models/languages.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Repository/repository.dart';
import '../../../Routes/routes.dart';
import '../../../Services/api_provider.dart';
import 'language_item.dart';

// import '../../../Router/routes.dart';
// import 'language_item.dart';
class LanguageSection extends StatefulWidget {
  final FocusNode firstLanguageItemFocusNode;
  final ScrollController scrollController;
  final Function(UserScrollNotification notification) onScroll;

  const LanguageSection(
      {super.key,
      required this.firstLanguageItemFocusNode,
      required this.scrollController,
      required this.onScroll});

  @override
  State<LanguageSection> createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  List<Language>? _languages;
  Future<List<Language>>? _languagesFuture;
  @override
  void initState() {
    super.initState();
    _languagesFuture = fetchLanguages(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(widget.firstLanguageItemFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, _) {
        debugPrint("Focus Check");
        if (_.hasData && (_.data != [])) {
          return LanguageSectionMain(
            scrollController: widget.scrollController,
            firstLanguageItemFocusNode: widget.firstLanguageItemFocusNode,
            onScroll: widget.onScroll,
          );
        }
        if (_.hasData && (_.data == [])) {
          return Container();
        }
        return Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          width: double.infinity,
          height: 11.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.white70,
                child: Container(
                  width: 40.w,
                  height: 11.h,
                  color: Colors.white30,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 3.w,
              );
            },
            itemCount: 4,
          ),
        );
      },
      future: _languagesFuture,
    );
  }

  Future<List<Language>> fetchLanguages(BuildContext context) async {
    final response = await ApiProvider.instance.getLanguages();
    if (response.status ?? false) {
      // if (!context.mounted) return;
      Provider.of<Repository>(context, listen: false)
          .addLanguages(response.languages);
      return response.languages;
    } else {
      return List<Language>.empty();
    }
  }
}

class LanguageSectionMain extends StatefulWidget {
  const LanguageSectionMain({
    super.key,
    required this.scrollController,
    required this.onScroll,
    required this.firstLanguageItemFocusNode,
  });

  final ScrollController scrollController;
  final Function(UserScrollNotification notification) onScroll;
  final FocusNode firstLanguageItemFocusNode;
  @override
  State<LanguageSectionMain> createState() => _LanguageSectionMainState();
}

class _LanguageSectionMainState extends State<LanguageSectionMain>{
  int current =0;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Repository>(context,listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      width: double.infinity,
      height: 11.h,
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
            var item = data.languages[index];
            // var item = data.languages[index];
            final bool isFocused = index == data.focusedLanguageIndex;
            final focusNode =
                index == 1 ? widget.firstLanguageItemFocusNode : FocusNode();
            return Focus(
              // Wrap in Focus widget
              focusNode: focusNode,
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  debugPrint("Focus Changed $index");
                  Provider.of<Repository>(context, listen: false)
                      .updateLanguageFocused(
                          index);
                  // setState(() {
                  //   current = index;
                  // });
                  // Or update your state variable
                }
              },
              child: LanguageItem(
                focusNode: focusNode,
                isFocused: isFocused,
                item: item,
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
          itemCount: data.languages.length,
        ),
      ),
    );
  }
  void _focusNextElement(data) {
    debugPrint("Clicked it");
    final currentFocus = FocusScope.of(context).focusedChild;
    int newIndex = (Provider.of<Repository>(context, listen: false).focusedLanguageIndex + 1) % Provider.of<Repository>(context, listen: false).languages.length;
    Provider.of<Repository>(context, listen: false).updateLanguageFocused(newIndex);
    currentFocus?.unfocus();
    FocusScope.of(context).requestFocus(data.languages[newIndex].focusNode);
  }

  void _focusPreviousElement(data) {
    debugPrint("Clicked it");
    final currentFocus = FocusScope.of(context).focusedChild;
    int newIndex = (Provider.of<Repository>(context, listen: false).focusedLanguageIndex - 1).clamp(0, Provider.of<Repository>(context, listen: false).languages.length - 1);
    Provider.of<Repository>(context, listen: false).updateLanguageFocused(newIndex);
    currentFocus?.unfocus();
    FocusScope.of(context).requestFocus(data.languages[newIndex].focusNode);
  }
}
