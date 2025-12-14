import 'package:flutter/material.dart';
import 'products_screen.dart';
import 'clients_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final screens = [
    const ProductsScreen(),
    const ClientsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory), label: 'Productos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: 'Clientes'),
        ],
      ),
    );
  }
}



// ---------------- MODELO ----------------
