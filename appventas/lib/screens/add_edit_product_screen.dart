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

  void saveProduct() {
  final price = double.tryParse(priceCtrl.text);

  if (nameCtrl.text.isEmpty || price == null || image == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Completa todos los campos correctamente')),
    );
    return;
  }

  if (widget.product == null) {
    LocalData.products.add(
      Product(
        name: nameCtrl.text,
        price: price,
        imagePath: image!.path,
      ),
    );
  } else {
    widget.product!.name = nameCtrl.text;
    widget.product!.price = price;
    widget.product!.imagePath = image!.path;
  }

  FocusScope.of(context).unfocus(); // 👈 evita crash del teclado
  Navigator.pop(context);
}


  Future pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (picked != null) {
      setState(() => image = File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null
            ? 'Agregar producto'
            : 'Editar producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: priceCtrl,
              decoration: const InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: pickImage,
              icon: const Icon(Icons.image),
              label: const Text('Seleccionar imagen'),
            ),
            if (image != null)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.file(image!, height: 120),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: saveProduct,
              child: const Text('Guardar producto'),
            ),
          ],
        ),
      ),
    );
  }
}



