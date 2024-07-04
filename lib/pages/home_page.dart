import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF6750A4);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Cursos'),
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
            const TextField(
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: screenHeight * 0.026),
            Row(
              children: [
                _buildCourseCard(
                    'Computación',
                    'Conceptos básicos y fundamentos de programación',
                    'assets/LogoEduSyncNegro.png'),
                SizedBox(width: screenWidth * 0.042),
                _buildCourseCard(
                    'Física Avanzada',
                    'Estudio de la mecánica clásica y sus aplicaciones',
                    'assets/LogoEduSyncAmarillo.png'),
                SizedBox(width: screenWidth * 0.042),
                _buildCourseCard(
                    'Química General',
                    'Principios básicos de química y sus reacciones',
                    'assets/LogoEduSyncAmarillo.png'),
              ],
            ),
            SizedBox(height: screenHeight * 0.036),
            _buildSectionHeader('TAREAS', () {}),
            _buildTaskCard('Tarea 1 de Programación',
                'Implementar un algoritmo de búsqueda'),
            _buildTaskCard(
                'Tarea de Física I', 'Resolver problemas de cinemática'),
            SizedBox(height: screenHeight * 0.036),
            _buildSectionHeader('AVISOS', () {}),
            _buildTaskCard(
                'Aviso de Química General', 'Se pospone la clase del lunes'),
            _buildTaskCard('Aviso de Programación',
                'Nuevo material de estudio disponible'),
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

  Widget _buildCourseCard(String title, String subtitle, String imagePath) {
    return Expanded(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath,
                height: 100, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(subtitle),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onViewAllPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: onViewAllPressed,
          child: const Text('Ver todas'),
        ),
      ],
    );
  }

  Widget _buildTaskCard(String title, String subtitle) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.insert_drive_file),
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
