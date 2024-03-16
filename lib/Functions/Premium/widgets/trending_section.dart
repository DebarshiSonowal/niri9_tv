import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:niri9/Functions/Trending/Widgets/trending_banner_item.dart';
// import 'package:niri9/Functions/Trending/Widgets/trending_slider_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

// import '../../../API/api_provider.dart';
import '../../../Repository/repository.dart';
import '../../../Services/api_provider.dart';
import '../../home/widgets/my_list_button.dart';
import 'trending_banner_item.dart';
import 'trending_slider_indicator.dart';

// import '../../HomeScreen/Widgets/my_list_button.dart';
// import '../../HomeScreen/Widgets/share_indicator.dart';

class TrendingBannerSection extends StatefulWidget {
  const TrendingBannerSection({super.key});

  @override
  State<TrendingBannerSection> createState() => _TrendingBannerSectionState();
}

class _TrendingBannerSectionState extends State<TrendingBannerSection> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      return SizedBox(
        width: double.infinity,
        height: 30.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            data.trendingBanner.isNotEmpty
                ? SizedBox(
                    height: 30.h,
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      // itemCount: data.bannerList.length,
                      itemCount: data.trendingBanner.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        var item = data.trendingBanner[index];
                        return TrendingBannerItem(item: item);
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        // enlargeCenterPage: true,
                        aspectRatio: 10.5 / 9,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                    ),
                  )
                : Container(),
            data.trendingBanner.isNotEmpty
                ? Container(
                    margin: EdgeInsets.only(
                      bottom: 1.h,
                    ),
                    width: double.infinity,
                    height: 5.h,
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   children: [
                    //     MyListButton(
                    //       hasMyList:
                    //       data.homeBanner[_current].hasMyList ?? false,
                    //       onTap: () {
                    //         addToMyList(data.homeBanner[_current].id);
                    //       },
                    //     ),
                    //     SizedBox(
                    //       width: 3.w,
                    //     ),
                    //     TrendingSliderIndicator(current: _current),
                    //     SizedBox(
                    //       width: 3.w,
                    //     ),
                    //     // ShareIndicator(
                    //     //   onTap: () {
                    //     //     Share.share("Check out our app on Play Store https://play.google.com/store/apps/details?id=com.niri.niri9}");
                    //     //   },
                    //     // ),
                    //   ],
                    // ),
                  )
                : Container(),
          ],
        ),
      );
    });
  }

  Future<void> addToMyList(int? id) async {
    final response = await ApiProvider.instance.addMyVideos(id);
    if (response.success ?? false) {
      Fluttertoast.showToast(msg: response.message ?? "Added To My List");
    } else {
      Fluttertoast.showToast(msg: response.message ?? "Something went wrong");
    }
  }
}
