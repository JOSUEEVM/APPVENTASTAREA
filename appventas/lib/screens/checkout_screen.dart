import 'package:flutter/material.dart';
import '../models/product.dart';

class CheckoutScreen extends StatelessWidget {
  final Product product;
  const CheckoutScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comprar ${product.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Dirección')),
            TextField(decoration: const InputDecoration(labelText: 'Teléfono')),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Confirmar compra'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Compra realizada')),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
