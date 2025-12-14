import '../models/user.dart';
import '../models/product.dart';

class LocalData {
  /// Usuarios locales (login)
  static List<User> users = [
    User(email: 'admin@gmail.com', password: '1234'),
  ];

  /// Productos creados
  static List<Product> products = [];
}

