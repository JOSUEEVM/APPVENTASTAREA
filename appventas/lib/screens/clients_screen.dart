import 'package:flutter/material.dart';
import '../data/local_data.dart';
import '../models/cart_item.dart';
import 'order_screen.dart';
import '../widgets/product_image.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  void addToCart(product) {
    setState(() {
      final index = LocalData.cart.indexWhere(
        (item) => item.product == product,
      );

      if (index >= 0) {
        LocalData.cart[index].quantity++;
      } else {
        LocalData.cart.add(CartItem(product: product));
      }
    });
  }

  double get total =>
      LocalData.cart.fold(0, (sum, item) => sum + item.subtotal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar productos'),
        backgroundColor: const Color(0xFF1976D2),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              if (LocalData.cart.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderScreen()),
                );
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: LocalData.products.length,
        itemBuilder: (_, i) {
          final p = LocalData.products[i];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: productImage(p.imagePath),
              title: Text(p.name),
              subtitle: Text('\$${p.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: () => addToCart(p),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.blue.shade50,
        child: Text(
          'Total: \$${total.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

