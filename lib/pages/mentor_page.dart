import 'package:flutter/material.dart';

class MentorInfoPage extends StatefulWidget {
  const MentorInfoPage({Key? key}) : super(key: key);

  @override
  State<MentorInfoPage> createState() => _MentorInfoPageState();
}

class _MentorInfoPageState extends State<MentorInfoPage> {
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
        title: const Text(''),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: customColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: screenHeight * 0.02),
            CircleAvatar(
              radius: screenWidth * 0.15,
              backgroundImage: const AssetImage('assets/person2.jpg'),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Christopher J. Levine',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Diseñador Gráfico en Google',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InfoCard(label: 'Cursos', value: '26'),
                InfoCard(label: 'Estudiantes', value: '15800'),
                InfoCard(label: 'Ratings', value: '8750'),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Handle follow action
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.grey[300],
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.015),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    ),
                  ),
                  child: const Text('Seguir'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle message action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: customColor,
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.015),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    ),
                  ),
                  child: const Text(
                    'Mensaje',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              color: Colors.grey[100],
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: const Text(
                'Es un profesional que comunica un mensaje de forma visual. En su día a día, resuelve desafíos muy concretos a nivel de comunicación y consecución de objetivos marcados.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              color: Colors.grey[100],
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TabButton(label: 'Cursos'),
                  TabButton(label: 'Ratings'),
                ],
              ),
            ),
            const CourseCard(
              title: 'Diseño Gráfico Avanzado',
              price: '\$28',
              oldPrice: '\$42',
              rating: '4.2',
              students: '7830 Std',
            ),
            const CourseCard(
              title: 'Diseño Gráfico Avanzado',
              price: '\$37',
              oldPrice: '\$41',
              rating: '4.2',
              students: '990 Std',
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const InfoCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          value,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class TabButton extends StatelessWidget {
  final String label;

  const TabButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Handle tab button tap
      },
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.width * 0.04,
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String price;
  final String oldPrice;
  final String rating;
  final String students;

  const CourseCard({
    Key? key,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.students,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF6750A4);

    return Card(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              color: Colors.black,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: customColor,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    'Precio Anterior: $oldPrice',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star,
                          color: Colors.amber,
                          size: MediaQuery.of(context).size.width * 0.04),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Text(rating),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text(students),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
