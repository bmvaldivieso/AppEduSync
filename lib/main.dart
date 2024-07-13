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
        GetPage(
          name: '/loginpage',
          page: () => const LoginPage(),
          transition: Transition.native,
        ),
        GetPage(
          name: '/registropage',
          page: () => const RegistroPage(),
          transition: Transition.native,
        ),
        GetPage(
          name: '/homepage',
          page: () => const HomePage(),
          transition: Transition.native,
        ),
        GetPage(
          name: '/asistenciapage',
          page: () => const AsistenciaPage(),
          transition: Transition.native,
        ),
        GetPage(
          name: '/tareaspage',
          page: () => const TareasPage(),
          transition: Transition.native,
        ),
        GetPage(
          name: '/avisospage',
          page: () => const AvisosPage(),
          transition: Transition.native,
        ),
        GetPage(
          name: '/calendariopage',
          page: () => const CalendarioPage(),
          transition: Transition.native,
        ),
        GetPage(
          name: '/listachatpage',
          page: () => const ChatListPage(),
          transition: Transition.native,
        ),
        GetPage(
          name: '/chatpage',
          page: () => const ChatPage(),
          transition: Transition.native,
        ),
        GetPage(
          name: '/errorpage',
          page: () => const ReportErrorPage(),
          transition: Transition.native,
        ),
      ],
    );
  }
}
