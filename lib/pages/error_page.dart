import 'package:flutter/material.dart';

class ReportErrorPage extends StatefulWidget {
  const ReportErrorPage({super.key});

  @override
  State<ReportErrorPage> createState() => _ReportErrorPageState();
}

class _ReportErrorPageState extends State<ReportErrorPage> {
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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    Color customColor = const Color(0xFF6750A4);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: customColor,
            ),
            onPressed: () {
              // Acción de más opciones
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.035),
            Text(
              'Reportar Error',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenHeight * 0.03,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              '¿Qué es lo que ocurre?',
              style: TextStyle(
                fontSize: screenHeight * 0.02,
              ),
            ),
            SizedBox(height: screenHeight * 0.046),
            TextField(
              decoration: InputDecoration(
                hintText: 'Escribe el problema que tienes',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              maxLines: 7,
            ),
            SizedBox(height: screenHeight * 0.045),
            Row(
              children: <Widget>[
                Container(
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.25,
                  color: Colors.grey[200],
                  child: const Icon(Icons.image),
                ),
                SizedBox(width: screenWidth * 0.06),
                const Text('Insertar Imagen'),
                const Spacer(),
                const Icon(Icons.arrow_forward),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: customColor,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  // Acción para enviar el reporte
                },
                child: Text(
                  'Enviar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.02,
                  ),
                ),
              ),
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
        currentIndex: 0,
        onTap: _onItemTapped,
      ),
    );
  }
}
