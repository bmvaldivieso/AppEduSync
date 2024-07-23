import 'package:flutter/material.dart';

class AddCreditCardPage extends StatefulWidget {
  const AddCreditCardPage({Key? key}) : super(key: key);

  @override
  State<AddCreditCardPage> createState() => _AddCreditCardPageState();
}

class _AddCreditCardPageState extends State<AddCreditCardPage> {
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
        title: const Text('Agregar nueva Tarjeta'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customColor),
          onPressed: () {
            Navigator.pop(context);
          },
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
        onTap: _onItemTapped,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.01),
            Card(
              color: customColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.04),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.recent_actors_outlined,
                      color: Colors.white,
                      size: screenWidth * 0.1,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      '1234  5678  8765  0876',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'valid thru 12/28',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.02,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'TIMMY C. HERNANDEZ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.02,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomTextField(
              label: 'Nombre de tarjeta*',
              initialValue: 'Belinda C. Cullen',
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            CustomTextField(
              label: 'Número de tarjeta*',
              initialValue: '**** **65 8765 3456',
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'Fecha de caducidad*',
                    initialValue: '12/28',
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: CustomTextField(
                    label: 'CVV*',
                    initialValue: '***',
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: customColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.23,
                    vertical: screenHeight * 0.02,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Agregar nueva tarjeta',
                  style: TextStyle(fontSize: screenHeight * 0.02),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String initialValue;
  final double screenHeight;
  final double screenWidth;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
        ),
      ),
    );
  }
}
