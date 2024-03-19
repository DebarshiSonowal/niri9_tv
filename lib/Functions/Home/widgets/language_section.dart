import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

// import 'package:niri9/Models/available_language.dart';
// import 'package:niri9/Navigation/Navigate.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

// import '../../../API/api_provider.dart';
import '../../../Constants/constants.dart';
import '../../../Models/languages.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Repository/repository.dart';
import '../../../Routes/routes.dart';
import '../../../Services/api_provider.dart';
import '../../home/widgets/language_section.dart';
import 'language_item.dart';
import 'language_section_main.dart';

// import '../../../Router/routes.dart';
// import 'language_item.dart';
class LanguageSection extends StatefulWidget {
  final FocusNode firstLanguageItemFocusNode, languageSectionFocusNode;
  final ScrollController scrollController;
  final Function(UserScrollNotification notification) onScroll;

  const LanguageSection({
    super.key,
    required this.firstLanguageItemFocusNode,
    required this.scrollController,
    required this.onScroll,
    required this.languageSectionFocusNode,
  });

  @override
  State<LanguageSection> createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  List<Language>? _languages;
  Future<List<Language>>? _languagesFuture;
  List<FocusNode> focusedNode = [];

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
            languageSectionFocusNode: widget.languageSectionFocusNode,
            scrollController: widget.scrollController,
            firstLanguageItemFocusNode: widget.firstLanguageItemFocusNode,
            onScroll: widget.onScroll,
            focusedNode: focusedNode,
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
      focusedNode.add(widget.firstLanguageItemFocusNode);
      for (int i = 1; i < response.languages.length; i++) {
        // Replace 'someNumber' appropriately
        focusedNode.add(FocusNode());
      }
      return response.languages;
    } else {
      return List<Language>.empty();
    }
  }
}
