import 'package:flutter/material.dart';
import 'screens/home.dart';


void main() {
runApp(const SalesApp());
}


class SalesApp extends StatelessWidget {
const SalesApp({super.key});


@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'App de Ventas',
theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
home: const HomeScreen(),
);
}
}
