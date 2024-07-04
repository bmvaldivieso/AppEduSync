import 'package:flutter/material.dart';

class TareasPage extends StatefulWidget {
  const TareasPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TareasPageState createState() => _TareasPageState();
}

class _TareasPageState extends State<TareasPage> {
  int _selectedIndex = 2;

  Color customColor = const Color(0xFF6750A4);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/homepage');
      }
      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, '/asistenciapage');
      }
      if (_selectedIndex == 3) {
        Navigator.pushNamed(context, '/avisospage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ToggleButtons(
                  borderRadius: BorderRadius.circular(20),
                  selectedBorderColor: customColor,
                  selectedColor: Colors.white,
                  fillColor: customColor,
                  color: Colors.black,
                  constraints: BoxConstraints(
                      minHeight: screenHeight * 0.05,
                      minWidth: screenWidth * 0.19),
                  isSelected: const [true, false, false],
                  children: const [Text('Hoy'), Text('Ayer'), Text('15 Abril')],
                  onPressed: (int index) {
                    // Acción al presionar el botón
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Acción para buscar
                  },
                ),
                TextButton(
                  onPressed: () {
                    // Acción para marcar todas como leídas
                  },
                  child: Text(
                    'Marca Todas',
                    style: TextStyle(
                      fontSize: screenHeight * 0.0135,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            _buildTaskCard(
                'Entrega de Proyecto de Computación',
                '2 M',
                'Recuerda subir el proyecto final de la asignatura de Computación.',
                Icons.calendar_today),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            _buildTaskCard(
                'Cambio de Fecha de Entrega',
                '2 H',
                'La fecha de entrega del proyecto de Programación ha sido modificada.',
                Icons.calendar_today,
                isHighlighted: true),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            _buildTaskCard(
                'Notas de Física',
                '3 H',
                'Revisa las nuevas notas de la última clase de Física.',
                Icons.note),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const Text('Ayer', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            _buildTaskCard(
                'Entrega de Tarea de Química',
                '1 D',
                'Sube la tarea de la semana pasada de Química.',
                Icons.calendar_today),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const Text('15 de Abril',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            _buildTaskCard(
                'Actualización del Historial Académico',
                '5 D',
                'Revisa las actualizaciones en tu historial académico.',
                Icons.history),
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

  Widget _buildTaskCard(
      String title, String time, String description, IconData icon,
      {bool isHighlighted = false}) {
    return Card(
      color: isHighlighted ? Colors.blue.shade50 : null,
      child: ListTile(
        leading: Icon(icon, color: customColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text(time),
        onTap: () {
          // Acción al presionar el elemento
        },
      ),
    );
  }
}
