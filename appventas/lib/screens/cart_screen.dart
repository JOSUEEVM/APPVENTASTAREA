import 'package:flutter/material.dart';
import '../data/local_data.dart';
import 'order_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = LocalData.cart;

    double total = cart.fold(
      0,
      (sum, item) => sum + item.product.price * item.quantity,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Carrito')),
      body: cart.isEmpty
          ? const Center(child: Text('Carrito vacío'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (_, i) {
                      final item = cart[i];
                      return ListTile(
                        title: Text(item.product.name),
                        subtitle: Text(
                            'Cantidad: ${item.quantity}'),
                        trailing: Text(
                          '\$${item.product.price * item.quantity}',
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    border: const Border(
                      top: BorderSide(color: Colors.blue),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Total: \$${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const OrderScreen(),
                            ),
                          );
                        },
                        child: const Text('Hacer pedido'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
