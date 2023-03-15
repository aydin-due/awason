import 'package:awason/screens/screens.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String checkAuth = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';
  static const String editVehicle = '/editVehicle';
  static const String editSector = '/editSector';
  static const String editPrice = '/editPrice';

  static final routes = <Route>[
    Route(route: checkAuth, screen: const CheckAuthScreen()),
    Route(route: login, screen: const LoginScreen()),
    Route(route: register, screen: const RegisterScreen()),
    Route(route: home, screen: const MainScreen()),
    Route(route: profile, screen: const ProfileScreen()),
    Route(route: editProfile, screen: const EditProfileScreen()),
    Route(route: editVehicle, screen: const EditVehicleScreen()),
    Route(route: editSector, screen: const EditSectorScreen()),
    Route(route: editPrice, screen: const EditPriceScreen()),
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
