import 'package:awason/screens/screens.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String login = '/login';

  static final routes = <Route>[
    Route(route: login, screen: const LoginScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final route in routes) {
      appRoutes.addAll({route.route: (BuildContext context) => route.screen});
    }
    return appRoutes;
  }
}

class Route {
  final String route;
  final Widget screen;

  Route(
      {required this.route,
      required this.screen});
}
