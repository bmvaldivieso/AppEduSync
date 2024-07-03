import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegistroPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _role = 'Profesor';

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF6750A4);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registro',
          style: TextStyle(fontSize: screenHeight * 0.032),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.04),
              Text(
                'Elija su rol:',
                style: TextStyle(
                  fontSize: screenHeight * 0.021,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.034),
              ToggleButtons(
                isSelected: [
                  _role == 'Profesor',
                  _role == 'Estudiante',
                  _role == 'Tutor'
                ],
                onPressed: (int index) {
                  setState(() {
                    if (index == 0) {
                      _role = 'Profesor';
                    } else if (index == 1) {
                      _role = 'Estudiante';
                    } else {
                      _role = 'Tutor';
                    }
                  });
                },
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Profesor'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Estudiante'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Tutor'),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.034),
              Text(
                'Registro:',
                style: TextStyle(
                  fontSize: screenHeight * 0.021,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.024),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  hintText: 'Input',
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Input',
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Repita su contraseña',
                  hintText: 'Input',
                ),
              ),
              SizedBox(height: screenHeight * 0.055),
              Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image),
                  ),
                  SizedBox(width: screenWidth * 0.06),
                  const Text('Insertar Imagen'),
                  const Spacer(),
                  const Icon(Icons.arrow_forward),
                ],
              ),
              SizedBox(height: screenHeight * 0.045),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Acción para registrarse
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: customColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 43, vertical: 15),
                  ),
                  child: Text(
                    'Registrarse',
                    style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
