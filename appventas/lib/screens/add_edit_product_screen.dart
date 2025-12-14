import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../data/local_data.dart';
import '../models/product.dart';

class AddEditProductScreen extends StatefulWidget {
  final Product? product;
  const AddEditProductScreen({super.key, this.product});

  @override
  State<AddEditProductScreen> createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  File? image;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      nameCtrl.text = widget.product!.name;
      priceCtrl.text = widget.product!.price.toString();
      image = File(widget.product!.imagePath);
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => image = File(picked.path));
    }
  }

  void save() {
    if (nameCtrl.text.isEmpty || priceCtrl.text.isEmpty || image == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Completa todos los campos')));
      return;
    }

    if (widget.product == null) {
      LocalData.products.add(
        Product(
          name: nameCtrl.text,
          price: double.parse(priceCtrl.text),
          imagePath: image!.path,
        ),
      );
    } else {
      widget.product!
        ..name = nameCtrl.text
        ..price = double.parse(priceCtrl.text)
        ..imagePath = image!.path;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product == null ? 'Agregar producto' : 'Editar producto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: image == null
                    ? const Center(child: Text('Toca para agregar imagen'))
                    : Image.file(image!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: priceCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Precio'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: save,
              child: const Text('Guardar producto'),
            ),
          ],
        ),
      ),
    );
  }
}

