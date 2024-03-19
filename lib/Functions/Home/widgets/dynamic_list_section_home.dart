import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../Constants/constants.dart';
import '../../../Models/sections.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Repository/repository.dart';
import '../../../Routes/routes.dart';
import '../../../Services/api_provider.dart';
import '../../../Widgets/shimmerring_loader.dart';
import 'dynamic_list_item.dart';

class DynamicListSectionHome extends StatefulWidget {
  const DynamicListSectionHome({super.key});

  @override
  State<DynamicListSectionHome> createState() => _DynamicListSectionHomeState();
}

class _DynamicListSectionHomeState extends State<DynamicListSectionHome> {
  List<FocusNode> focusNodes = [];
  List<List<FocusNode>> sectionWiseList = [];
  int current = 0;
  ScrollController scController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, _) {
        if (_.hasData && (_.data != null)) {
          return Consumer<Repository>(builder: (context, data, _) {
            return ListView.builder(
              controller: scController,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var item = data.homeSections[index];
                final focusNode = focusNodes[index];
                return item.videos.isNotEmpty
                    ? DynamicListItem(
                        focusNode: focusNode,
                        text: item.title ?? "",
                        list: item.videos ?? [],
                        onTap: () {
                          // Navigation.instance.navigate(Routes.moreScreen,
                          //     args: item.title ?? "");
                        },
                        focusNodes: sectionWiseList[index],
                        onDown: () {
                          if (current < focusNodes.length) {
                            current++; // Update 'current' directly
                            FocusScope.of(context)
                                .requestFocus(focusNodes[current]);
                            Scrollable.ensureVisible(
                              focusNodes[current].context!,
                              alignment: 0.5,
                              // ... customization parameters ...
                            );
                            setState(() {}); // Read the Repository
                          }
                        },
                        onUp: () {
                          if (current > 0) {
                            current--; // Update 'current' directly
                            FocusScope.of(context)
                                .requestFocus(focusNodes[current]);
                            Scrollable.ensureVisible(
                              focusNodes[current].context!,
                              alignment: 0.5,
                              // ... customization parameters ...
                            );
                            setState(() {});
                          }
                        },
                      )
                    : Container();
              },
              itemCount: data.homeSections.length,
            );
          });
        }
        if (_.hasData && (_.data == null)) {
          return Container();
        }
        if (_.hasError) {
          return Container();
        }
        return SizedBox(
            width: double.infinity,
            height: 50.h,
            child: const ShimmerLanguageScreen());
      },
      future: fetchSections(context),
    );
  }

  Future<List<Sections>> fetchSections(context) async {
    final response = await ApiProvider.instance.getSections("home", '1', '');
    if (response.status ?? false) {
      // if (!context.mounted) return;
      Provider.of<Repository>(context, listen: false)
          .addHomeSections(response.sections);
      // await fetchVideos(response.sections[0]);
      for (var i = 0; i < response.sections.length; i++) {
        focusNodes.add(FocusNode());
        List<FocusNode> nodes = [];
        for (var j in response.sections[i].videos) {
          nodes.add(FocusNode());
        }
        sectionWiseList.add(nodes);
      }
      return response.sections ?? List<Sections>.empty();
    } else {
      return List<Sections>.empty();
    }
  }
}
