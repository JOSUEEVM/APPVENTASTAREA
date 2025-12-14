import 'package:flutter/material.dart';
import '../data/local_data.dart';
import '../models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void addProduct() {
    setState(() {
      LocalData.products.add(
        Product(name: 'Nuevo producto', price: 0),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      floatingActionButton: FloatingActionButton(
        onPressed: addProduct,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: LocalData.products.length,
        itemBuilder: (_, i) {
          final p = LocalData.products[i];
          return ListTile(
            title: Text(p.name),
            subtitle: Text('\$${p.price}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  LocalData.products.removeAt(i);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
