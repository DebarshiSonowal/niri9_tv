import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// import '../../../API/api_provider.dart';
import '../../../Models/sections.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Repository/repository.dart';
import '../../../Routes/routes.dart';
import '../../../Services/api_provider.dart';
import '../../../Widgets/shimmerring_loader.dart';
import 'dynamic_premium_list_item.dart';
// import '../../../Router/routes.dart';
// import '../../LanguageSelectedPage/language_selected_page.dart';
// import 'dynamic_premium_list_item.dart';

class TrendingDynamicItems extends StatefulWidget {
  const TrendingDynamicItems({super.key, required this.page});
  final int page;
  @override
  State<TrendingDynamicItems> createState() => _TrendingDynamicItemsState();
}

class _TrendingDynamicItemsState extends State<TrendingDynamicItems> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, _) {
        if (_.hasData && (_.data != [])) {
          return Consumer<Repository>(builder: (context, data, _) {
            return Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var item = data.trendingSections[index];
                  return DynamicPremiumListItem(
                    text: item.title ?? "",
                    list: item.videos ?? [],
                    onTap: () {
                      // Navigation.instance.navigate(Routes.moreScreen, args: item.title ?? "");
                    },
                  );
                },
                itemCount: data.trendingSections.length,
              ),
            );
          });
        }
        if (_.hasData && (_.data == [])) {
          return Container();
        }
        return SizedBox(
            width: double.infinity,
            height: 50.h,
            child: const ShimmerLanguageScreen());
      },
      future: fetchDetails(context, widget.page),
    );
  }

  Future<List<Sections>> fetchDetails(context, page) async {
    final response1 =
    await ApiProvider.instance.getSections("trending", "$page",'');
    if (response1.status ?? false) {
      Provider.of<Repository>(context, listen: false)
          .addTrendingSections(response1.sections ?? []);
      return response1.sections;
    } else {
      return List<Sections>.empty();
    }
  }
}