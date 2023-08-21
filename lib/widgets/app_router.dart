import 'package:flutter/material.dart';
import 'package:to_do_app/screens/recylce_bin.dart';
import 'package:to_do_app/screens/tab_screen.dart';


class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case TabScreen.id:
        return MaterialPageRoute(
          builder: (_) =>  const TabScreen(),
        );
      default:
        return null;
    }
  }
}
