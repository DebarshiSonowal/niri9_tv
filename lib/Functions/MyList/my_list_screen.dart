import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/common_functions.dart';
import '../../Models/video.dart';
import '../../Repository/repository.dart';
import '../../Services/api_provider.dart';
import '../../Storage/storage.dart';
import '../../Widgets/common_appbar.dart';
import '../Home/widgets/otp_item.dart';
import '../Rental/widgets/grid_view_shimmering.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  final ScrollController _scrollController = ScrollController();
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(6.h),
        child: CommonAppbar(
          title: "My List",
          // starting: 20.w,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
        ),
        child: FutureBuilder(
            builder: (context, _) {
              if (_.hasData && (_.data?.isNotEmpty??false)) {
                return Consumer<Repository>(builder: (context, data, _) {
                  return GridView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: data.wishList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 1.5.w,
                      mainAxisSpacing: 1.h,
                      childAspectRatio: 6.5 / 8.5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var item = data.wishList[index];
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
                          });
                    },
                  );
                });
              }
              if (_.hasData && (_.data?.isEmpty??true)) {
                return Center(
                  child: Container(
                    child: Text(
                      "Something Went wrong",
                      style: Theme.of(context).textTheme?.bodySmall?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                );
              }
              return const GridViewShimmering();
            },
            future: fetchDetails()),
      ),
    );
  }

  Future<List<Video>> fetchDetails() async {
    final response = await ApiProvider.instance.getMyVideos();
    if (response.success ?? false) {
      Provider.of<Repository>(context, listen: false)
          .setWishList(response.videos);
      return response.videos;
    } else {
      return List<Video>.empty();
    }
  }
}
