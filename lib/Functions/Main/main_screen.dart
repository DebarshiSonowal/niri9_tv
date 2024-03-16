import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:niri9_tv/Constants/assets.dart';
import 'package:niri9_tv/Constants/constants.dart';
import 'package:niri9_tv/Functions/home/home_screen.dart';
import 'package:niri9_tv/Functions/premium/premium_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';

import '../Search/search_screen.dart';
import '../rental/rental_screen.dart';
import '../settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  int selected = 0;
  String? version;

  @override
  void initState() {
    // Connect SideMenuController and PageController together

    fetchDetails();
    super.initState();
    // sideMenu.addListener((index) {
    //   debugPrint("Side $index");
    //   if (index < 0) {
    //     setState(() {
    //       sideMenu.changePage(selected);
    //       // pageController.jumpToPage(0);
    //     });
    //   } else {
    //     setState(() {
    //       pageController.jumpToPage(index);
    //       selected = index;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(4.h),
      //   child: Row(
      //     children: [
      //       Image.asset(
      //         Assets.logo,
      //         scale: 25,
      //       ),
      //     ],
      //   ),
      // ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // SideMenu(
          //   // Page controller to manage a PageView
          //   controller: sideMenu,
          //   showToggle: true,
          //   // Will shows on top of all items, it can be a logo or a Title text
          //   title: Container(
          //     margin: EdgeInsets.only(
          //       bottom: 2.h,
          //     ),
          //     child: Wrap(
          //       crossAxisAlignment: WrapCrossAlignment.center,
          //       alignment: WrapAlignment.center,
          //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           padding: EdgeInsets.all(2.w),
          //           decoration: BoxDecoration(
          //             color: Colors.grey.shade900,
          //             shape: BoxShape.circle,
          //           ),
          //           child: Icon(
          //             FontAwesomeIcons.user,
          //             color: Colors.white,
          //             size: 12.sp,
          //           ),
          //         ),
          //         SizedBox(
          //           width: 17.w,
          //           child: Text(
          //             'Debarshi',
          //             textAlign: TextAlign.center,
          //             style: Theme.of(context).textTheme.bodySmall?.copyWith(
          //                   fontSize: 7.sp,
          //                   color: Colors.white,
          //                 ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          //   // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
          //   footer: Text(
          //     '$version',
          //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
          //           fontSize: 8.sp,
          //           color: Colors.white,
          //         ),
          //   ),
          //   // Notify when display mode changed
          //   onDisplayModeChanged: (mode) {
          //     print(mode);
          //   },
          //   // collapseWidth: 5.w.toInt(),
          //   // List of SideMenuItem to show them on SideMenu
          //   items: [
          //     SideMenuItem(
          //       title: 'Dashboard',
          //       onTap: (index, _) {
          //         sideMenu.changePage(index);
          //       },
          //       icon: Icon(
          //         Icons.home,
          //         color: Colors.white,
          //       ),
          //       badgeContent: Text(
          //         '3',
          //         style: TextStyle(color: Colors.white, fontSize: 8.sp),
          //       ),
          //     ),
          //     SideMenuItem(
          //       title: 'Search',
          //       onTap: (index, _) {
          //         sideMenu.changePage(index);
          //       },
          //       icon: const Icon(
          //         Icons.search,
          //         color: Colors.white,
          //       ),
          //     ),
          //     SideMenuItem(
          //       title: 'Premium',
          //       onTap: (index, _) {
          //         sideMenu.changePage(index);
          //       },
          //       icon: Icon(
          //         Icons.money,
          //         color: Colors.white,
          //       ),
          //     ),
          //     SideMenuItem(
          //       title: 'Rent',
          //       onTap: (index, _) {
          //         sideMenu.changePage(index);
          //       },
          //       icon: Icon(
          //         FontAwesomeIcons.ticket,
          //         color: Colors.white,
          //       ),
          //     ),
          //     SideMenuItem(
          //       title: 'Settings',
          //       onTap: (index, _) {
          //         sideMenu.changePage(index);
          //       },
          //       icon: Icon(
          //         FontAwesomeIcons.gear,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ],
          //   style: SideMenuStyle(
          //       displayMode: SideMenuDisplayMode.compact,
          //       // decoration: BoxDecoration(),
          //       openSideMenuWidth: 200,
          //       compactSideMenuWidth: 12.w,
          //       selectedHoverColor: Colors.white,
          //       hoverColor: Constants.secondaryColor,
          //       selectedColor: Colors.red,
          //       selectedIconColor: Colors.white,
          //       unselectedIconColor: Colors.white38,
          //       backgroundColor: Colors.transparent,
          //       selectedTitleTextStyle: TextStyle(
          //         color: Colors.white,
          //         fontSize: 9.sp,
          //       ),
          //       unselectedTitleTextStyle: TextStyle(
          //         color: Colors.white38,
          //         fontSize: 8.sp,
          //       ),
          //       iconSize: 12.sp,
          //       itemBorderRadius: const BorderRadius.all(
          //         Radius.circular(5.0),
          //       ),
          //       showTooltip: true,
          //       itemHeight: 5.h,
          //       itemInnerSpacing: 1.h,
          //       itemOuterPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          //       toggleColor: Colors.white
          //   ),
          // ),
          NavigationRail(
            backgroundColor: Colors.grey.shade900,
            indicatorColor: Colors.white,
            useIndicator: true,
            selectedIndex: selected,
            labelType: NavigationRailLabelType.selected,
            // indicatorShape: RectangleShapeBorder(
            //     borderRadius: DynamicBorderRadius.only(
            //         topLeft: DynamicRadius.circular(10.toPXLength),
            //         bottomRight: DynamicRadius.elliptical(60.0.toPXLength, 10.0.toPercentLength))
            // ),
            unselectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            unselectedLabelTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontSize: 9.sp,
            ),
            selectedIconTheme: const IconThemeData(
              color: Colors.black,
            ),
            selectedLabelTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontSize: 9.sp,
            ),
            // extended: true,
            onDestinationSelected: (int index) {
              debugPrint("onDestinationSelected ${index}");

              goToDest(index);
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Dashboard'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.search),
                label: Text('Search'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.money),
                label: Text('Premium'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.ticket),
                label: Text('Rent'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.gear),
                label: Text('Settings'),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                HomeScreen(),
                SearchScreen(
                  filters: "",
                ),
                PremiumScreen(),
                RentalScreen(),
                SettingsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchDetails() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    setState(() {});
  }
  void goToDest(int index) {
    if(index < 0){
      pageController.jumpToPage(selected);
    }else{
      setState(() {
        selected = index;
      });
      pageController.jumpToPage(index);
    }
  }
}
