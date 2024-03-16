import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../Models/sections.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Repository/repository.dart';
import '../../../Routes/routes.dart';
import '../../../Services/api_provider.dart';
import '../../../Widgets/shimmerring_loader.dart';
import 'dynamic_list_item.dart';

class DynamicListSectionHome extends StatelessWidget {
  const DynamicListSectionHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, _) {
        if (_.hasData && (_.data != null)) {
          return Consumer<Repository>(builder: (context, data, _) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var item = data.homeSections[index];
                return item.videos.isNotEmpty
                    ? DynamicListItem(
                  text: item.title ?? "",
                  list: item.videos ?? [],
                  onTap: () {
                    // Navigation.instance.navigate(Routes.moreScreen,
                    //     args: item.title ?? "");
                  },
                )
                    : Container();
              },
              itemCount: data.homeSections.length,
            );
          });
        }
        if(_.hasData && (_.data == null)){
          return Container();
        }
        if(_.hasError){
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
    final response = await ApiProvider.instance.getSections("home", '1','');
    if (response.status ?? false) {
      // if (!context.mounted) return;
      Provider.of<Repository>(context, listen: false)
          .addHomeSections(response.sections);
      // await fetchVideos(response.sections[0]);
      return response.sections ?? List<Sections>.empty();
    } else {
      return List<Sections>.empty();
    }
  }
}