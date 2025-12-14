import 'package:flutter/material.dart';
import 'products.dart';
import 'clients.dart';
import 'sales.dart';


class HomeScreen extends StatefulWidget {
const HomeScreen({super.key});


@override
State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
int index = 0;


final screens = const [
  ProductsScreen(),
  ClientsScreen(),
  SalesScreen(),
];


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Sistema de Ventas')),
body: screens[index],
bottomNavigationBar: NavigationBar(
selectedIndex: index,
onDestinationSelected: (i) => setState(() => index = i),
destinations: const [
NavigationDestination(icon: Icon(Icons.inventory), label: 'Productos'),
NavigationDestination(icon: Icon(Icons.people), label: 'Clientes'),
NavigationDestination(icon: Icon(Icons.point_of_sale), label: 'Ventas'),
],
),
);
}
}


// ---------------- MODELO ----------------
