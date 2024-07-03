import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Inicio'),
    Text('Asistencia'),
    Text('Tareas'),
    Text('Avisos'),
    Text('Calendario'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, '/asistenciapage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF6750A4);

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
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                _buildCourseCard(
                    'Revisión Grupo 2',
                    'Lorem ipsum dolor sit amet, consectetur',
                    'assets/LogoEduSyncAmarillo.png'),
                SizedBox(width: 16),
                _buildCourseCard(
                    'Header',
                    'Lorem ipsum dolor sit amet, consectetur',
                    'assets/LogoEduSyncAmarillo.png'),
                SizedBox(width: 16),
                _buildCourseCard(
                    'Header',
                    'Lorem ipsum dolor sit amet, consectetur',
                    'assets/LogoEduSyncAmarillo.png'),
              ],
            ),
            SizedBox(height: 32),
            _buildSectionHeader('TAREAS', () {}),
            _buildTaskCard('Row Header', 'Body copy description'),
            _buildTaskCard('Row Header', 'Body copy description'),
            SizedBox(height: 32),
            _buildSectionHeader('AVISOS', () {}),
            _buildTaskCard('Row Header', 'Body copy description'),
            _buildTaskCard('Row Header', 'Body copy description'),
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
              child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
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
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: onViewAllPressed,
          child: Text('Ver todas'),
        ),
      ],
    );
  }

  Widget _buildTaskCard(String title, String subtitle) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.insert_drive_file),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Acción al presionar el elemento
        },
      ),
    );
  }
}
