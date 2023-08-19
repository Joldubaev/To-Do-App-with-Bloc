import 'package:flutter/material.dart';
import 'package:to_do_app/screens/recylce_bin.dart';
import 'package:to_do_app/screens/task_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case TaskScreen.id:
        return MaterialPageRoute(
          builder: (_) => const TaskScreen(),
        );
      default:
        return null;
    }
  }
}
