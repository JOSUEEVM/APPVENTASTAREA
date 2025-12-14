import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'select_location_screen.dart';

class OrderScreen extends StatefulWidget {
  final String productName;
  final double price;

  const OrderScreen({
    super.key,
    required this.productName,
    required this.price,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();

  LatLng? selectedLocation;

  void submitOrder() {
    if (addressCtrl.text.isEmpty ||
        phoneCtrl.text.isEmpty ||
        selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    // SIMULACIÓN DE PEDIDO GUARDADO
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Pedido realizado'),
        content: Text(
          'Producto: ${widget.productName}\n'
          'Precio: \$${widget.price}\n'
          'Teléfono: ${phoneCtrl.text}\n'
          'Dirección: ${addressCtrl.text}\n'
          'Ubicación:\n'
          'Lat: ${selectedLocation!.latitude}\n'
          'Lng: ${selectedLocation!.longitude}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    addressCtrl.dispose();
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realizar pedido'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.productName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$${widget.price}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: addressCtrl,
              decoration: const InputDecoration(
                labelText: 'Dirección',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: phoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Teléfono',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            ElevatedButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Seleccionar ubicación en el mapa'),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SelectLocationScreen(),
                  ),
                );

                if (result != null) {
                  setState(() {
                    selectedLocation = result;
                  });
                }
              },
            ),

            if (selectedLocation != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Ubicación seleccionada:\n'
                  'Lat: ${selectedLocation!.latitude}\n'
                  'Lng: ${selectedLocation!.longitude}',
                ),
              ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submitOrder,
                child: const Text('Confirmar pedido'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
