import 'menu.dart';
import 'order.dart';

class Restaurant {
  String name;
  Menu menu = Menu();
  List<Order> orders = [];

  Restaurant({required this.name});

  void addOrder(Order order) {
    orders.add(order);
  }

  void removeOrder(String orderId) {
    orders.removeWhere((o) => o.id == orderId);
  }

  Order? getOrderById(String id) {
    try {
      return orders.firstWhere((o) => o.id == id);
    } catch (e) {
      return null;
    }
  }
}
