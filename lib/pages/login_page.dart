import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF6750A4);

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Iniciar sesión',
                  style: TextStyle(
                      fontSize: screenHeight * 0.043,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.013),
                Text(
                  'Por favor, inicia sesión en tu cuenta',
                  style: TextStyle(fontSize: screenHeight * 0.015),
                ),
                SizedBox(height: screenHeight * 0.066),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo',
                    hintText: 'Ingresa Email',
                  ),
                ),
                SizedBox(height: screenHeight * 0.036),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Ingresa Contraseña',
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
                SizedBox(height: screenHeight * 0.018),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Acción para recuperar contraseña
                    },
                    child: const Text('¿Olvidó su contraseña?'),
                  ),
                ),
                SizedBox(height: screenHeight * 0.018),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/homepage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: customColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Iniciar sesión',
                    style: TextStyle(
                        fontSize: screenHeight * 0.02, color: Colors.white),
                  ),
                ),
                SizedBox(height: screenHeight * 0.031),
                Text(
                  'O continua con',
                  style: TextStyle(fontSize: screenHeight * 0.019),
                ),
                SizedBox(height: screenHeight * 0.021),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/google.png'),
                      onPressed: () {
                        // Acción para iniciar sesión con Google
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/facebook.png'),
                      onPressed: () {
                        // Acción para iniciar sesión con Facebook
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/apple.png'),
                      onPressed: () {
                        // Acción para iniciar sesión con Apple
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.019),
                TextButton(
                  onPressed: () {
                    // Acción para registrarse
                  },
                  child: Text(
                    '¿No tienes una cuenta? Regístrate',
                    style: TextStyle(color: customColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
