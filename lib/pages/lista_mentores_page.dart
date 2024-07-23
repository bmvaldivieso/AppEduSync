import 'package:flutter/material.dart';

class MentorsListPage extends StatefulWidget {
  const MentorsListPage({Key? key}) : super(key: key);

  @override
  State<MentorsListPage> createState() => _MentorsListPageState();
}

class _MentorsListPageState extends State<MentorsListPage> {
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
        title: const Text('Mentores'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: customColor),
            onPressed: () {
              // Handle search action
            },
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
      body: ListView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        children: <Widget>[
          MentorTile(
            name: 'William K. Olivas',
            specialty: 'Diseño 3D',
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          MentorTile(
            name: 'Donald S. Channel',
            specialty: 'Artes y Humanidades',
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          MentorTile(
            name: 'Elvira E. Limones',
            specialty: 'Desarrollo personal',
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          MentorTile(
            name: 'Scott S. Simpson',
            specialty: 'SEO & Marketing',
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          MentorTile(
            name: 'Patricia G. Peters',
            specialty: 'Productividad en la oficina',
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          MentorTile(
            name: 'Carmen P. Mercado',
            specialty: 'Desarrollo web',
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          MentorTile(
            name: 'Steven C. Barnhart',
            specialty: '3D Design',
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }
}

class MentorTile extends StatelessWidget {
  final String name;
  final String specialty;
  final double screenHeight;
  final double screenWidth;

  const MentorTile({
    Key? key,
    required this.name,
    required this.specialty,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black,
          radius: screenWidth * 0.07,
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: screenHeight * 0.02),
        ),
        subtitle: Text(
          specialty,
          style: TextStyle(fontSize: screenHeight * 0.016),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/mentorpage');
        },
      ),
    );
  }
}
