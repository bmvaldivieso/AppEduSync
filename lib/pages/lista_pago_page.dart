import 'package:flutter/material.dart';

class PaymentOptionsPage extends StatefulWidget {
  const PaymentOptionsPage({Key? key}) : super(key: key);

  @override
  State<PaymentOptionsPage> createState() => _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {
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
        title: const Text('Opción de Pago'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customColor),
          onPressed: () {
            Navigator.pushNamed(context, '/usuariopage');
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
            PaymentCard(
              connected: false,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            PaymentCard(
              connected: false,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            PaymentCard(
              connected: false,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            PaymentCard(
              connected: true,
              cardNumber: '**** **** **76 3054',
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tarjetapage');
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

class PaymentCard extends StatelessWidget {
  final bool connected;
  final String? cardNumber;
  final double screenHeight;
  final double screenWidth;

  const PaymentCard({
    Key? key,
    required this.connected,
    this.cardNumber,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF6750A4);

    return Card(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      elevation: 2.0,
      child: ListTile(
        title: Text(cardNumber ?? ''),
        trailing: Text(
          connected ? 'Conectado' : 'Conectar',
          style: TextStyle(
            color: connected ? Colors.green : customColor,
            fontSize: screenHeight * 0.018,
          ),
        ),
        onTap: () {
          // Handle card tap
        },
      ),
    );
  }
}
