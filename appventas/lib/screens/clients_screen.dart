import 'package:flutter/material.dart';


class ClientsScreen extends StatefulWidget {
const ClientsScreen({super.key});


@override
State<ClientsScreen> createState() => _ClientsScreenState();
}


class _ClientsScreenState extends State<ClientsScreen> {
final List<String> clients = [];


void addClient() {
final ctrl = TextEditingController();
showDialog(
context: context,
builder: (_) => AlertDialog(
title: const Text('Nuevo Cliente'),
content: TextField(controller: ctrl, decoration: const InputDecoration(labelText: 'Nombre')),
actions: [
ElevatedButton(
onPressed: () {
setState(() => clients.add(ctrl.text));
Navigator.pop(context);
},
child: const Text('Guardar'),
)
],
),
);
}


@override
Widget build(BuildContext context) {
return Scaffold(
floatingActionButton: FloatingActionButton(onPressed: addClient, child: const Icon(Icons.add)),
body: ListView.builder(
itemCount: clients.length,
itemBuilder: (_, i) => ListTile(
title: Text(clients[i]),
trailing: IconButton(
icon: const Icon(Icons.delete),
onPressed: () => setState(() => clients.removeAt(i)),
),
),
),
);
}
}