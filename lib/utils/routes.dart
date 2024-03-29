import 'package:awason/screens/screens.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String checkAuth = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String myProfile = '/myProfile';
  static const String editProfile = '/editProfile';
  static const String editVehicle = '/editVehicle';
  static const String editSector = '/editSector';
  static const String editPrice = '/editPrice';
  static const String orderHistory = '/orderHistory';
  static const String balance = '/balance';
  static const String order = '/order';
  static const String profile = '/profile';

  static final routes = <Route>[
    Route(route: checkAuth, screen: const CheckAuthScreen()),
    Route(route: login, screen: const LoginScreen()),
    Route(route: register, screen: const RegisterScreen()),
    Route(route: home, screen: const MainScreen()),
    Route(route: myProfile, screen: const MyProfileScreen()),
    Route(route: editProfile, screen: const EditProfileScreen()),
    Route(route: editVehicle, screen: const EditVehicleScreen()),
    Route(route: editSector, screen: const EditSectorScreen()),
    Route(route: editPrice, screen: const EditPriceScreen()),
    Route(route: orderHistory, screen: const OrderHistoryScreen()),
    Route(route: balance, screen: const BalanceScreen()),
    Route(route: order, screen: const OrderScreen()),
    Route(route: profile, screen: const ProfileScreen()),
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
