import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Models/category.dart';
import '../../Navigation/Navigate.dart';
import '../../Repository/repository.dart';
import '../../Routes/routes.dart';
import '../../Services/api_provider.dart';
import '../../Storage/storage.dart';
import '../../Widgets/common_appbar.dart';
import '../home/widgets/otp_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.filters});
  final String? filters;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TextEditingController _searchController = TextEditingController();
  // Genres? selectedGenre;
  // Sections? selectedSections;
  Category? selectedCategory;
  int page_no = 1;
  String currentSearch="";
  final searchEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<Repository>(context,listen: false).updateIndex(1);
      selectedCategory =
      Provider.of<Repository>(context, listen: false).categories[0];
      setState(() {});
      if (widget.filters != "") {
        selectedCategory = Provider.of<Repository>(context, listen: false)
            .categories
            .firstWhere((element) => element.name == widget.filters);
        search("");
      }else{
        search("");
      }

    });
    searchEditingController.addListener(() {
      setState(() {
        currentSearch = searchEditingController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(6.h),
        child: CommonAppbar(title: "Search",),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.h,
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: TextField(
                  controller: searchEditingController,
                  onChanged: (String val) {
                    suggest(val);
                  },
                  style:  Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white38,
                    fontSize: 12.sp,
                  ),
                  decoration: InputDecoration(
                    // labelText: 'Search',
                    hintText: 'Search...',
                    fillColor: Colors.grey.shade900,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade800,
                      size: 16.sp,
                    ),
                    hintStyle:
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white38,
                              fontSize: 10.sp,
                            ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Consumer<Repository>(builder: (context, data, _) {
                return SizedBox(
                  height: 40.h,
                  child: GridView.builder(
                    itemCount: data.specificVideos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 2.w,
                      mainAxisSpacing: 0.5.h,
                      childAspectRatio: 8.5 / 11,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var item = data.specificVideos[index];
                      return OttItem(
                        item: item,
                        onTap: () {
                          if (Storage.instance.isLoggedIn) {
                            // Navigation.instance
                            //     .navigate(Routes.watchScreen, args: item.id);
                          } else {
                            // CommonFunctions().showLoginDialog(context);
                          }
                        },
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
  void search(String search) async {
    // Navigation.instance.navigate(Routes.loadingScreen);
    final response = await ApiProvider.instance.search(search);
    if (response.success ?? false) {
      // Navigation.instance.goBack();
      debugPrint("Search ${response.videos.length}");
      Provider.of<Repository>(context, listen: false)
          .setSearchVideos(response.videos);
    } else {
      // Navigation.instance.goBack();
    }
  }
  void suggest(String search) async {
    // Navigation.instance.navigate(Routes.loadingScreen);
    final response = await ApiProvider.instance.search(search);
    if (response.success ?? false) {
      // Navigation.instance.goBack();
      Provider.of<Repository>(context, listen: false)
          .setSearchVideos(response.videos);
    } else {
      // Navigation.instance.goBack();
    }
  }
}
