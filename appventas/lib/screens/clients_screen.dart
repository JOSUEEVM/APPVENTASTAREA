import 'package:flutter/material.dart';
import '../data/local_data.dart';
import 'checkout_screen.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comprar productos')),
      body: ListView.builder(
        itemCount: LocalData.products.length,
        itemBuilder: (_, i) {
          final p = LocalData.products[i];
          return ListTile(
            title: Text(p.name),
            subtitle: Text('\$${p.price}'),
            trailing: ElevatedButton(
              child: const Text('Comprar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CheckoutScreen(product: p),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
