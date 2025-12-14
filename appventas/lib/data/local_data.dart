import '../models/product.dart';
import '../models/user.dart';
import '../models/cart_item.dart';

class LocalData {
  static List<User> users = [
    User(email: 'josue', password: '123456'),
  ];  
  static List<Product> products = [
    Product(name: 'Producto A', price: 100),
    Product(name: 'Producto B', price: 150),
  ];

  static List<CartItem> cart = [];
}
