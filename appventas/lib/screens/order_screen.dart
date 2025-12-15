import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../data/local_data.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  LatLng? selectedLocation = LatLng(19.4326, -99.1332);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Datos de entrega')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: phoneCtrl,
              keyboardType: TextInputType.phone,
              decoration:
                  const InputDecoration(labelText: 'Teléfono'),
            ),
            TextField(
              controller: addressCtrl,
              decoration:
                  const InputDecoration(labelText: 'Dirección'),
            ),
            const SizedBox(height: 15),

            SizedBox(
              height: 250,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: selectedLocation!,
                  initialZoom: 16,
                  onTap: (_, point) {
                    setState(() => selectedLocation = point);
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName:
                        'com.example.appventas',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: selectedLocation!,
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                LocalData.cart.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Pedido realizado correctamente'),
                  ),
                );

                Navigator.popUntil(
                    context, (route) => route.isFirst);
              },
              child: const Text('Confirmar pedido'),
            ),
          ],
        ),
      ),
    );
  }
}



