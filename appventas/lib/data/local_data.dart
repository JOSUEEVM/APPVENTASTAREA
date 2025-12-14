import '../models/user.dart';
import '../models/product.dart';
import '../models/client.dart';

class LocalData {
  static List<User> users = [
    User(email: 'admin@local.com', password: '123456'),
  ];

  static List<Product> products = [];
  static List<Client> clients = [];
}
