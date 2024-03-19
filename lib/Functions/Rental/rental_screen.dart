import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/common_functions.dart';
import '../../Models/video.dart';
import '../../Navigation/Navigate.dart';
import '../../Repository/repository.dart';
import '../../Routes/routes.dart';
import '../../Services/api_provider.dart';
import '../../Storage/storage.dart';
import '../../Widgets/common_appbar.dart';
import '../home/widgets/otp_item.dart';
import 'widgets/grid_view_shimmering.dart';

class RentalScreen extends StatefulWidget {
  const RentalScreen({super.key});

  @override
  State<RentalScreen> createState() => _RentalScreenState();
}

class _RentalScreenState extends State<RentalScreen> {
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  List<FocusNode> focus = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(6.h),
        child: CommonAppbar(
          title: "Rental",
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 0.5.h,
          horizontal: 2.w,
        ),
        height: double.infinity,
        width: double.infinity,
        child: FutureBuilder(
            builder: (context, _) {
              if (_.hasData && (_.data != [])) {
                return Consumer<Repository>(builder: (context, data, _) {
                  return GridView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: data.specificVideos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 1.5.w,
                      mainAxisSpacing: 1.h,
                      childAspectRatio: 6.5 / 8.5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var item = data.specificVideos[index];
                      return OttItem(
                        item: item,
                        onTap: () {
                          if (Storage.instance.isLoggedIn) {
                            // Navigation.instance.navigate(
                            //     Routes.watchScreen,
                            //     args: item.id);
                          } else {
                            CommonFunctions().showLoginDialog(context);
                          }
                        },
                        focus: focus[index],
                      );
                    },
                  );
                });
              }
              if (_.hasData && (_.data == [])) {
                return Container();
              }
              return const GridViewShimmering();
            },
            future: fetchDetails(page, "", null, null, null)),
      ),
    );
  }

  Future<List<Video>> fetchDetails(int page_no, String sections,
      String? category, String? genres, String? term) async {
    final response = await ApiProvider.instance.getVideos(
      page_no,
      sections,
      category,
      genres,
      term,
      "rent",
      null,
    );
    if (response.success ?? false) {
      Provider.of<Repository>(context, listen: false)
          .setSearchVideos(response.videos);
      return response.videos;
    } else {
      return List<Video>.empty();
    }
  }
}
