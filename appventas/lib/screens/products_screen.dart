import 'dart:io';
import 'package:flutter/material.dart';
import '../data/local_data.dart';
import 'add_product_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddProductScreen()),
          );
          setState(() {});
        },
      ),
      body: ListView.builder(
        itemCount: LocalData.products.length,
        itemBuilder: (_, i) {
          final p = LocalData.products[i];
          return ListTile(
            leading: Image.file(File(p.imagePath), width: 50),
            title: Text(p.name),
            subtitle: Text('\$${p.price}'),
          );
        },
      ),
    );
  }
}

