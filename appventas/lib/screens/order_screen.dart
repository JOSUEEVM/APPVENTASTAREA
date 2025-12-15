import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final addressCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  LatLng? selectedLocation;

  Future<void> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) return;

    final pos = await Geolocator.getCurrentPosition();
    setState(() {
      selectedLocation = LatLng(pos.latitude, pos.longitude);
    });
  }

  void confirmOrder() {
    if (addressCtrl.text.isEmpty ||
        phoneCtrl.text.isEmpty ||
        selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pedido realizado con éxito')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Datos del pedido')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: addressCtrl,
              decoration: const InputDecoration(
                labelText: 'Dirección',
                prefixIcon: Icon(Icons.home),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: phoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Teléfono',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: getLocation,
              icon: const Icon(Icons.map),
              label: const Text('Seleccionar ubicación'),
            ),

            const SizedBox(height: 15),

            if (selectedLocation != null)
              SizedBox(
                height: 250,
                child: FlutterMap(
                  options: MapOptions(
  initialCenter: selectedLocation!,
  initialZoom: 16,
  onTap: (tapPosition, point) {
    setState(() => selectedLocation = point);
  },
),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.appventas',
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
              onPressed: confirmOrder,
              child: const Text('Confirmar pedido'),
            ),
          ],
        ),
      ),
    );
  }
}


