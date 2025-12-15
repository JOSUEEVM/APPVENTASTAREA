import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  LatLng selectedLocation = LatLng(19.4326, -99.1332); // fallback CDMX
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1️⃣ Verifica GPS
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => loading = false);
      return;
    }

    // 2️⃣ Permisos
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      setState(() => loading = false);
      return;
    }

    // 3️⃣ Obtener posición
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      selectedLocation = LatLng(position.latitude, position.longitude);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selecciona tu ubicación')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(
                initialCenter: selectedLocation,
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
                      point: selectedLocation,
                      width: 50,
                      height: 50,
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
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.check),
        label: const Text('Confirmar'),
        onPressed: () {
          Navigator.pop(context, selectedLocation);
        },
      ),
    );
  }
}

