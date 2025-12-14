import 'package:flutter/material.dart';
import '../data/local_data.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final total = LocalData.cart.fold(
      0.0,
      (sum, item) => sum + item.subtotal,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar pedido'),
        backgroundColor: const Color(0xFF1976D2),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: LocalData.cart.map((item) {
                return ListTile(
                  title: Text(item.product.name),
                  subtitle: Text(
                    '${item.quantity} x \$${item.product.price}',
                  ),
                  trailing: Text(
                    '\$${item.subtotal.toStringAsFixed(2)}',
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'TOTAL: \$${total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1976D2),
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {
              LocalData.cart.clear();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pedido realizado')),
              );
            },
            child: const Text('Confirmar compra'),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

