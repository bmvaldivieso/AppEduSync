import 'package:flutter/material.dart';

class AvisosPage extends StatefulWidget {
  const AvisosPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AvisosPageState createState() => _AvisosPageState();
}

class _AvisosPageState extends State<AvisosPage> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/homepage');
      }
      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, '/asistenciapage');
      }
      if (_selectedIndex == 2) {
        Navigator.pushNamed(context, '/tareaspage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF6750A4);

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Avisos'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_rounded,
              color: customColor,
            ),
            onPressed: () {
              // Acción para mostrar más opciones
            },
          ),
        ],
      ),
      drawer: Drawer(
        surfaceTintColor: customColor,
        // Agrega aquí los elementos del Drawer
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildSectionHeader('Física I', height: screenHeight * 0.02),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              _buildNotificationCard(
                'Próximo examen de Física',
                'El examen será el 20 de julio. No olvides estudiar los capítulos 3 y 4.',
                Icons.school,
                Colors.red,
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              _buildNotificationCard(
                'Laboratorio de Física',
                'El laboratorio sobre fuerzas está programado para mañana.',
                Icons.science,
                Colors.green,
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              _buildNotificationCard(
                'Entrega de Tarea',
                'Recuerda entregar la tarea de física sobre vectores antes del 25 de junio.',
                Icons.assignment,
                Colors.red,
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              _buildSectionHeader('Biología', height: screenHeight * 0.02),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              _buildNotificationCard(
                'Clase de Biología Molecular',
                'La próxima clase será sobre ADN y replicación. Prepárate leyendo el capítulo 5.',
                Icons.book,
                Colors.purple,
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              _buildNotificationCard(
                'Proyecto de Biología',
                'El proyecto sobre ecosistemas debe entregarse el 1 de julio.',
                Icons.assignment_turned_in,
                Colors.green,
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              _buildNotificationCard(
                'Visita al laboratorio',
                'Habrá una visita al laboratorio de biotecnología el 15 de agosto.',
                Icons.location_on,
                Colors.red,
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              _buildNotificationCard(
                'Seminario de Biología',
                'Seminario sobre avances en biotecnología el 10 de julio. Inscripciones abiertas.',
                Icons.event,
                Colors.orange,
              ),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle, color: Colors.black),
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

  Widget _buildSectionHeader(String title, {double height = 16}) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: height,
      ),
    );
  }

  Widget _buildNotificationCard(
      String title, String subtitle, IconData icon, Color iconColor) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
