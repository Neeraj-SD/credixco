import 'package:flutter/material.dart';
import 'package:musicplayer/screens/details_screen.dart';

import '../screens/home_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/details':
        return MaterialPageRoute(builder: (_) => DetailsScreen());

      default:
        return null;
    }
  }
}
