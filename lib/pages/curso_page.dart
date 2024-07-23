import 'package:flutter/material.dart';

class CursoPage extends StatelessWidget {
  const CursoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF6750A4);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Cursos'),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: customColor,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_rounded, color: customColor),
            onPressed: () {
              Navigator.pushNamed(context, '/usuariopage');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: customColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.account_circle,
                      size: 62, color: Colors.white),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Albert Stevano Bajefski',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.026,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    'Albertstevano@gmail.com',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: screenHeight * 0.017,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                'Inicio',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight * 0.02,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: Text(
                'Calendario',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight * 0.02,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/calendariopage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: Text(
                'Cursos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight * 0.02,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/listacursospage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: Text(
                'Chat',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight * 0.02,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/listachatpage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.build),
              title: Text(
                'Configuración',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight * 0.02,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text(
                'Sobre nosotros',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight * 0.02,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person_pin_rounded),
              title: Text(
                'Asistencia',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight * 0.02,
                ),
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: Text(
                'Cerrar sesión',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: screenHeight * 0.02,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar …',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Expanded(
              child: ListView(
                children: const [
                  CourseSection(
                    sectionTitle: 'Sección 01 - Introducción',
                    sectionDuration: '25 Mins',
                    lessons: [
                      CourseLesson(
                        lessonNumber: '01',
                        lessonTitle: '¿Por qué utilizar diseñ..',
                        lessonDuration: '15 Mins',
                        isCompleted: true,
                      ),
                      CourseLesson(
                        lessonNumber: '02',
                        lessonTitle: 'Configura tu diseño gráfi..',
                        lessonDuration: '10 Mins',
                        isCompleted: true,
                      ),
                    ],
                  ),
                  CourseSection(
                    sectionTitle: 'Sección 02 - Diseño gráfico',
                    sectionDuration: '55 Mins',
                    lessons: [
                      CourseLesson(
                        lessonNumber: '03',
                        lessonTitle: 'Echa un vistazo al dise..',
                        lessonDuration: '08 Mins',
                        isCompleted: false,
                      ),
                      CourseLesson(
                        lessonNumber: '04',
                        lessonTitle: 'Trabajando con Diseño G..',
                        lessonDuration: '25 Mins',
                        isCompleted: false,
                      ),
                      CourseLesson(
                        lessonNumber: '05',
                        lessonTitle: 'Trabajando con Frame...',
                        lessonDuration: '12 Mins',
                        isCompleted: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: ElevatedButton(
          onPressed: () {
            // Acción para continuar cursos
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: customColor,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Continuar curso',
                style: TextStyle(
                    color: Colors.white, fontSize: screenHeight * 0.02),
              ),
              SizedBox(width: screenWidth * 0.02),
              const Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseSection extends StatelessWidget {
  final String sectionTitle;
  final String sectionDuration;
  final List<CourseLesson> lessons;

  const CourseSection({
    super.key,
    required this.sectionTitle,
    required this.sectionDuration,
    required this.lessons,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    Color customColor = const Color(0xFF6750A4);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
          child: Text(
            '$sectionTitle - $sectionDuration',
            style: TextStyle(
              color: customColor,
              fontSize: screenHeight * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: lessons,
        ),
      ],
    );
  }
}

class CourseLesson extends StatelessWidget {
  final String lessonNumber;
  final String lessonTitle;
  final String lessonDuration;
  final bool isCompleted;

  const CourseLesson({
    super.key,
    required this.lessonNumber,
    required this.lessonTitle,
    required this.lessonDuration,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Color customColor = const Color(0xFF6750A4);

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
            spreadRadius: 2.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.2),
            child: Text(
              lessonNumber,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenHeight * 0.02,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lessonTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenHeight * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  lessonDuration,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: screenHeight * 0.017,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            isCompleted ? Icons.play_arrow : Icons.lock,
            color: isCompleted ? customColor : Colors.grey,
          ),
        ],
      ),
    );
  }
}
