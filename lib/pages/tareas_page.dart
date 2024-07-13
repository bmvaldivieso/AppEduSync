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
      if (_selectedIndex == 4) {
        Navigator.pushNamed(context, '/calendariopage');
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
                      minWidth: screenWidth * 0.18),
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
                      fontSize: screenHeight * 0.01355,
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
