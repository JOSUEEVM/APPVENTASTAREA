import 'package:flutter/material.dart';
import '../screens/order_screen.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comprar productos')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Laptop'),
              subtitle: const Text('\$12000'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OrderScreen(
                      productName: 'Laptop',
                      price: 12000,
                    ),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Mouse'),
              subtitle: const Text('\$350'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OrderScreen(
                      productName: 'Mouse',
                      price: 350,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

