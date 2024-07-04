import 'package:flutter/material.dart';

class AsistenciaPage extends StatefulWidget {
  const AsistenciaPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AsistenciaPageState createState() => _AsistenciaPageState();
}

class _AsistenciaPageState extends State<AsistenciaPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/homepage');
      }
      if (_selectedIndex == 2) {
        Navigator.pushNamed(context, '/tareaspage');
      }
      if (_selectedIndex == 3) {
        Navigator.pushNamed(context, '/avisospage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF6750A4);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Asistencia'),
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
            SizedBox(height: screenHeight * 0.04),
            const Text(
              'Hola, en que te puede ayudar?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.04),
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            _buildTaskCard(Icons.help, 'Cómo Usar la App',
                'Aprende a usar todas las funciones de la aplicación',
                width: screenWidth * 0.2, height: screenHeight * 0.125),
            SizedBox(height: screenHeight * 0.02),
            _buildTaskCard(Icons.bug_report, 'Reportar Error',
                'Informa sobre cualquier error que encuentres',
                width: screenWidth * 0.2, height: screenHeight * 0.125),
            SizedBox(height: screenHeight * 0.02),
            _buildTaskCard(Icons.question_answer, 'Ayuda con Dudas',
                'Obtén asistencia para resolver tus dudas',
                width: screenWidth * 0.2, height: screenHeight * 0.125),
            SizedBox(height: screenHeight * 0.02),
            _buildTaskCard(Icons.contact_support, 'Soporte Técnico',
                'Contacta al soporte técnico para más ayuda',
                width: screenWidth * 0.2, height: screenHeight * 0.125),
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

  Widget _buildTaskCard(IconData icon, String title, String subtitle,
      {double width = 300, double height = 100}) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            // Acción al presionar el elemento
          },
        ),
      ),
    );
  }
}
