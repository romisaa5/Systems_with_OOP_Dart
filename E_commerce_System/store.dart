import 'order.dart';
import 'products.dart';
import 'user.dart';

class Store {
  List<Product> _products = [];
  List<User> _users = [];
  List<Order> _orders = [];


  List<Product> get products => _products;

  List<User> get users => _users;

  
  List<Order> get orders => _orders;

  void addProduct(Product product) {
    _products.add(product);
    print("✅ Product '${product.name}' added to the store.");
  }


  void registerUser(User user) {
    _users.add(user);
    print("👤 User '${user.username}' registered successfully.");
  }

  
  void placeOrder(Order order) {
    _orders.add(order);
    print("📦 Order #${order.id} placed successfully.");
  }


  void displayProducts() {
    if (_products.isEmpty) {
      print("🚫 No products available in the store.");
      return;
    }
    print("\n🛒 Store Products:");
    for (var product in _products) {
      product.displayProduct();
    }
  }
}
