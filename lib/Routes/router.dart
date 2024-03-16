import 'package:flutter/material.dart';
// import 'package:niri9_tv/Functions/home/main_screen.dart';
import 'package:niri9_tv/Routes/routes.dart';

import '../Functions/SplashScreen/splash_screen.dart';
import '../Functions/main/main_screen.dart';
import '../Widgets/transition_page_router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return FadeTransitionPageRouteBuilder(page: const SplashScreen());
    case Routes.homeScreen:
      return FadeTransitionPageRouteBuilder(page: const MainScreen());
    default:
      return FadeTransitionPageRouteBuilder(
        page: Container(),
      );
  }
}
