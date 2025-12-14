import 'package:flutter/material.dart';
import '../data/local_data.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  String error = '';

  void login() {
  final users = LocalData.users.where(
    (u) =>
        u.email == emailCtrl.text &&
        u.password == passCtrl.text,
  );

  if (users.isEmpty) {
    setState(() => error = 'Credenciales incorrectas');
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'App Ventas',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 12),
            if (error.isNotEmpty)
              Text(error, style: const TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: login,
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
