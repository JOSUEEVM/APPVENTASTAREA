import 'package:flutter/material.dart';
import 'products_screen.dart';
import 'clients_screen.dart';
import 'sales_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final screens = const [
    ProductsScreen(),
    ClientScreen(),
    SalesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: screens[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout),
            label: 'Clientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Ventas',
          ),
        ],
      ),
    );
  }
}
