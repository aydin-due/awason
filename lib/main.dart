import 'package:awason/providers/providers.dart';
import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: const MaterialColor(0xFF160084, {
            50: Color(0xFF558B2F),
            100: Color(0xFF558B2F),
            200: Color(0xFF558B2F),
            300: Color(0xFF558B2F),
            400: Color(0xFF558B2F),
            500: Color(0xFF558B2F),
            600: Color(0xFF558B2F),
            700: Color(0xFF558B2F),
            800: Color(0xFF558B2F),
            900: Color(0xFF558B2F),
          }),
          canvasColor: Colors.white
        ),
        debugShowCheckedModeBanner: false,
        title: Texts.title,
        initialRoute: Routes.checkAuth,
        routes: Routes.getAppRoutes(),
      ),
    );
  }
}
