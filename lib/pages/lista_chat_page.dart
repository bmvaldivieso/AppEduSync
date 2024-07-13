import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
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
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/homepage');
      }
      if (_selectedIndex == 4) {
        Navigator.pushNamed(context, '/calendariopage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF6750A4);

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bandeja de Entrada'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Acción de más opciones
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildChatItem(
              'Virginia M. Patterson',
              'Hola, buenas noches estimado estudiante!',
              '03',
              '14:59',
              context),
          _buildChatItem('Dominick S. Jenkins', '¡Acabo de terminarlo!', '02',
              '06:35', context),
          _buildChatItem(
              'Duncan E. Hoffman',
              'Podría ser interesante si estás pensando en iniciar algo propio en el futuro.',
              '',
              '08:10',
              context),
          _buildChatItem('Roy R. McCraney', 'Definitivamente me interesa. ',
              '05', '21:07', context),
          _buildChatItem(
              'Janice R. Norris',
              'En cuanto a psicología del desarrollo, el curso con la profesora Martínez tiene muy buenas críticas.',
              '',
              '09:15',
              context),
          _buildChatItem(
              'Marilyn C. Amerson',
              'Sí, he oído que es muy práctico y orientado a proyectos reales.',
              '03',
              '14:59',
              context),
          _buildChatItem(
              'Dominick S. Jenkins',
              'reo que vamos a tener un semestre bastante productiv',
              '02',
              '06:35',
              context),
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
        currentIndex: 0,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildChatItem(String name, String message, String unreadCount,
      String time, BuildContext context) {
    Color customColor = const Color(0xFF6750A4);
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name),
        subtitle: Text(message),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (unreadCount.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: customColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  unreadCount,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            const SizedBox(height: 4),
            Text(time),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, '/chatpage');
        },
      ),
    );
  }
}
