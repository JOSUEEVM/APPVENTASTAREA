import '../models/product.dart';
import '../models/user.dart';
import '../models/cart_item.dart';

class LocalData {
  static List<User> users = [
    User(email: 'josue', password: '123456'),
  ];  
  static List<Product> products = [
    Product(
      name: 'Laptop',
      price: 15000,
      imagePath: 'assets/images/laptop.png',
    ),
    Product(
      name: 'Mouse',
      price: 350,
      imagePath: 'assets/images/mouse.png',
    ),
    Product(
      name: 'Teclado',
      price: 650,
      imagePath: 'assets/images/teclado.png',
    ),
    Product(
      name: 'Monitor',
      price: 4200,
      imagePath: 'assets/images/monitor.png',
    ),
    Product(
      name: 'Celular',
      price: 9800,
      imagePath: 'assets/images/celular.png',
    ),
    Product(
      name: 'Audífonos',
      price: 1200,
      imagePath: 'assets/images/audifonos.png',
    ),
    Product(
      name: 'Impresora',
      price: 3500,
      imagePath: 'assets/images/impresora.png',
    ),
    Product(
      name: 'Tablet',
      price: 7200,
      imagePath: 'assets/images/tablet.png',
    ),
    Product(
      name: 'Memoria USB',
      price: 180,
      imagePath: 'assets/images/usb.png',
    ),
    Product(
      name: 'Bocina Bluetooth',
      price: 950,
      imagePath: 'assets/images/bocina.png',
    ),
  ];

  static List<CartItem> cart = [];
}
