import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/splash_morado.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/LogoEduSyncNegro.png',
                      height: constraints.maxHeight * 0.24,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 55),
                    Image.asset(
                      'assets/spinner.gif',
                      width: constraints.maxWidth * 0.4,
                      height: constraints.maxHeight * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
