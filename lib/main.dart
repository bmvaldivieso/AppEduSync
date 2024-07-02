import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'pages/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.blue[900]),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      home: const SplashPage(),
      getPages: [
        GetPage(
          name: '/home',
          page: () => const InicioPage(),
          transition: Transition.native,
        ),
      ],
    );
  }
}
