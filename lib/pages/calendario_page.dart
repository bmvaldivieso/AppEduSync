import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  DateTime selectedDate = DateTime.now();
  int _selectedIndex = 4;
  Color customColor = const Color(0xFF6750A4);

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
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/homepage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () {
              // Acción para mostrar más opciones
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
                Navigator.pushNamed(context, '/calendariopage');
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
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/calendariopage');
              },
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
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/calendariopage');
              },
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
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/calendariopage');
              },
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
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEE, MMM d').format(selectedDate),
                  style: TextStyle(
                    fontSize: screenHeight * 0.027,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple[50],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CalendarDatePicker(
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        onDateChanged: (date) {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildSectionHeader('CLASES', () {}),
                _buildClassCard('Ingeniería en Sistemas',
                    'Introducción a la Programación, Estructuras de Datos y Algoritmos'),
                _buildClassCard(
                    'Medicina', 'Anatomía Humana, Fisiología, Microbiología'),
                _buildClassCard('Derecho',
                    'Derecho Civil, Derecho Administrativo, Derecho de la Seguridad Social')
              ],
            ),
          ],
        ),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onViewAllPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextButton(
          onPressed: onViewAllPressed,
          child: const Text('Ver todas', style: TextStyle(fontSize: 15)),
        ),
      ],
    );
  }

  Widget _buildClassCard(String title, String subtitle) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.bookmark_add_rounded, color: Colors.grey),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Acción al presionar el elemento
        },
      ),
    );
  }
}
