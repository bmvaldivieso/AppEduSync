import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF6750A4);
    Color customColor2 = const Color(0xFFE9F6FE);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/splash_blanco.jpg',
            fit: BoxFit.cover,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: screenHeight * 0.07),
                    SizedBox(
                      width: screenWidth * 0.52,
                      height: screenWidth * 0.52,
                      child: Image.asset(
                        'assets/LogoEduSyncNegro.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.085),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text:
                              '¡Bienvenido a EduSync, tu plataforma de aprendizaje online! Aquí encontrarás una gran variedad de cursos interactivos y emocionantes, impartidos por instructores expertos en sus campos. Sumérgete en un mundo de conocimientos y desarrolla tus habilidades con nuestros cursos online de alta calidad.',
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.017,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth * 0.05),
                color: Colors.black.withOpacity(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: customColor,
                        minimumSize:
                            Size(screenWidth * 0.59, screenHeight * 0.06),
                      ),
                      child: Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                            fontSize: screenHeight * 0.028,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: customColor2,
                        minimumSize:
                            Size(screenWidth * 0.59, screenHeight * 0.06),
                      ),
                      child: Text(
                        'Registrarse',
                        style: TextStyle(
                            fontSize: screenHeight * 0.028, color: customColor),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.11),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
