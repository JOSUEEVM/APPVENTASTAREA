import 'package:flutter/material.dart';
import '../data/local_data.dart';
import '../models/product.dart';
import 'add_edit_product_screen.dart';

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
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEditProductScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: LocalData.products.isEmpty
          ? const Center(child: Text('No hay productos'))
          : ListView.builder(
              itemCount: LocalData.products.length,
              itemBuilder: (_, i) {
                final p = LocalData.products[i];
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      p.imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(p.name),
                    subtitle: Text('\$${p.price}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    AddEditProductScreen(product: p),
                              ),
                            );
                            setState(() {});
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() => LocalData.products.removeAt(i));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}


