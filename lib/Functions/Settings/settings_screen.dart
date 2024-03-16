import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niri9_tv/Functions/MyList/my_list_screen.dart';
import 'package:niri9_tv/Navigation/Navigate.dart';
import 'package:niri9_tv/Routes/routes.dart';
import 'package:niri9_tv/Storage/storage.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/constants.dart';
import '../../Widgets/common_appbar.dart';
import '../About/about_screen.dart';
import '../Subscription/subscription_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  PageController pageController = PageController();
  SideMenuController sideMenuController = SideMenuController();
  int selected = 0;

  @override
  void initState() {
    // Connect SideMenuController and PageController together

    // fetchDetails();
    super.initState();
    // sideMenuController.addListener((index) {
    //   debugPrint("Side $index");
    //   if (index < 0) {
    //     setState(() {
    //       sideMenuController.changePage(selected);
    //       // pageController.jumpToPage(0);
    //     });
    //   } else {
    //     setState(() {
    //       pageController.jumpToPage(index);
    //       selected=index;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          children: [
            // SideMenu(
            //   controller: sideMenuController,
            //   showToggle: true,
            //   // Will shows on top of all items, it can be a logo or a Title text
            //   // title: Container(
            //   //   margin: EdgeInsets.only(
            //   //     bottom: 2.h,
            //   //   ),
            //   //   child: SizedBox(
            //   //     width: 17.w,
            //   //     child: Text(
            //   //       'Settings',
            //   //       textAlign: TextAlign.center,
            //   //       style: Theme.of(context).textTheme.bodySmall?.copyWith(
            //   //             fontSize: 7.sp,
            //   //             color: Colors.white,
            //   //           ),
            //   //     ),
            //   //   ),
            //   // ),
            //   // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
            //   // collapseWidth: 5.w.toInt(),
            //   // List of SideMenuItem to show them on SideMenu
            //   items: [
            //     SideMenuItem(
            //       title: 'My Account>',
            //       onTap: (index, _) {
            //         sideMenuController.changePage(index);
            //       },
            //       icon: const Icon(
            //         Icons.video_collection_sharp,
            //         color: Colors.white,
            //       ),
            //       // badgeContent: Text(
            //       //   '3',
            //       //   style: TextStyle(color: Colors.white, fontSize: 8.sp),
            //       // ),
            //     ),
            //     SideMenuItem(
            //       title: 'Subscription',
            //       onTap: (index, _) {
            //         sideMenuController.changePage(index);
            //       },
            //       icon: const Icon(
            //         Icons.ondemand_video,
            //         color: Colors.white,
            //       ),
            //     ),
            //     SideMenuItem(
            //       title: 'Orders',
            //       onTap: (index, _) {
            //         sideMenuController.changePage(index);
            //       },
            //       icon: const Icon(
            //         FontAwesomeIcons.boxesPacking,
            //         color: Colors.white,
            //       ),
            //     ),
            //     SideMenuItem(
            //       title: 'About',
            //       onTap: (index, _) {
            //         sideMenuController.changePage(index);
            //       },
            //       icon: const Icon(
            //         FontAwesomeIcons.info,
            //         color: Colors.white,
            //       ),
            //     ),
            //     SideMenuItem(
            //       title: 'Sign Out',
            //       onTap: (index, _) {
            //        Storage.instance.logout();
            //        Navigation.instance.navigateAndRemoveUntil(Routes.homeScreen);
            //       },
            //       icon: const Icon(
            //         FontAwesomeIcons.signOut,
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
            SizedBox(
              height: double.infinity,
              child: NavigationRail(
                backgroundColor: const Color(0xff21252b),
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
                unselectedLabelTextStyle:
                    Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 9.sp,
                        ),
                selectedIconTheme: const IconThemeData(
                  color: Colors.black,
                ),
                selectedLabelTextStyle:
                    Theme.of(context).textTheme.bodySmall?.copyWith(
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
                    icon: Icon(
                      Icons.video_collection_sharp,
                    ),
                    label: Text(
                      'My List',
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.ondemand_video,
                    ),
                    label: Text(
                      'Subscription',
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      FontAwesomeIcons.info,
                    ),
                    label: Text(
                      'About',
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      FontAwesomeIcons.signOut,
                    ),
                    label: Text(
                      'Sign Out',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: const [
                  MyListScreen(),
                  SubscriptionScreen(),
                  AboutScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToDest(int index) {
    if (index != 3) {
      setState(() {
        pageController.jumpToPage(index);
        selected = index;
      });
    } else if (Storage.instance.isLoggedIn) {
      Storage.instance.logout();
    } else {}
  }
}
