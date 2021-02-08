import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upstreet_flutter_code_challenge/routes/app_routes.dart';
import 'package:upstreet_flutter_code_challenge/routes/app_routes_constant.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'POC',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      getPages: AppRouter.route,
      theme: ThemeData(
        primaryColor: const Color(0xff01046d),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: routeHome,
    );
  }
}
