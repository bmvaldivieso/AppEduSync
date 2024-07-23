import 'package:flutter/material.dart';

class ListaCursos extends StatefulWidget {
  const ListaCursos({super.key});

  @override
  State<ListaCursos> createState() => _ListaCursosState();
}

class _ListaCursosState extends State<ListaCursos> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, '/asistenciapage');
      }
      if (_selectedIndex == 2) {
        Navigator.pushNamed(context, '/tareaspage');
      }
      if (_selectedIndex == 3) {
        Navigator.pushNamed(context, '/avisospage');
      }
      if (_selectedIndex == 4) {
        Navigator.pushNamed(context, '/calendariopage');
      }
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/homepage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Color customColor = const Color(0xFF6750A4);

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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar …',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Terminado',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight * 0.02,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Acción para mostrar los cursos en curso
                  },
                  child: Text(
                    'En curso',
                    style: TextStyle(
                      color: customColor,
                      fontSize: screenHeight * 0.02,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildCourseCard(
                    screenHeight,
                    screenWidth,
                    'Diseño UI/UX',
                    'Introducción al diseño UI/UX',
                    context,
                    4.4,
                    '3 Hrs 06 Min',
                    93,
                    125),
                _buildCourseCard(
                    screenHeight,
                    screenWidth,
                    'Desarrollo web',
                    'Desarrollo de sitio web Wordpress...',
                    context,
                    3.9,
                    '1 Hrs 58 Min',
                    12,
                    31),
                _buildCourseCard(screenHeight, screenWidth, 'Diseño UI/UX',
                    '3D Blender y UI/UX', context, 4.6, '2 Hrs 46 Min', 56, 98),
                _buildCourseCard(
                    screenHeight,
                    screenWidth,
                    'Diseño UI/UX',
                    'Learn UX User Persona',
                    context,
                    3.9,
                    '2 Hrs 15 Min',
                    29,
                    35),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_rounded, color: Colors.black),
            label: 'Asistencia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment, color: Colors.black),
            label: 'Tareas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black),
            label: 'Avisos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Colors.black),
            label: 'Calendario',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCourseCard(
      double screenHeight,
      double screenWidth,
      String category,
      String title,
      BuildContext context,
      double rating,
      String duration,
      int completed,
      int total) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/cursopage');
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenHeight * 0.02),
            child: Row(
              children: [
                Container(
                  width: screenHeight * 0.08,
                  height: screenHeight * 0.08,
                  color: Colors.black,
                ),
                SizedBox(width: screenWidth * 0.05),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: screenHeight * 0.018,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.022,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: [
                          Icon(Icons.star,
                              color: Colors.yellow, size: screenHeight * 0.018),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            rating.toString(),
                            style: TextStyle(fontSize: screenHeight * 0.018),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Icon(Icons.access_time, size: screenHeight * 0.018),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            duration,
                            style: TextStyle(fontSize: screenHeight * 0.018),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            '$completed/$total',
                            style: TextStyle(fontSize: screenHeight * 0.018),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
