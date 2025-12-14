import 'package:flutter/material.dart';
import '../models/item.dart';


class ProductsScreen extends StatefulWidget {
const ProductsScreen({super.key});


@override
State<ProductsScreen> createState() => _ProductsScreenState();
}


class _ProductsScreenState extends State<ProductsScreen> {
final List<Item> products = [];


void addProduct() {
showDialog(
context: context,
builder: (_) {
final nameCtrl = TextEditingController();
final priceCtrl = TextEditingController();
return AlertDialog(
title: const Text('Nuevo Producto'),
content: Column(
mainAxisSize: MainAxisSize.min,
children: [
TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Nombre')),
TextField(controller: priceCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Precio')),
],
),
actions: [
TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
ElevatedButton(
onPressed: () {
setState(() => products.add(Item(nameCtrl.text, double.parse(priceCtrl.text))));
Navigator.pop(context);
},
child: const Text('Guardar'),
)
],
);
},
);
}


@override
Widget build(BuildContext context) {
return Scaffold(
floatingActionButton: FloatingActionButton(onPressed: addProduct, child: const Icon(Icons.add)),
body: ListView.builder(
itemCount: products.length,
itemBuilder: (_, i) => ListTile(
title: Text(products[i].name),
subtitle: Text('\$${products[i].price}'),
trailing: IconButton(
icon: const Icon(Icons.delete),
onPressed: () => setState(() => products.removeAt(i)),
),
),
),
);
}
}