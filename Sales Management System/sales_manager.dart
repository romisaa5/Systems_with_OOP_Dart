
import 'order.dart';

class SalesManager {
  List<Order> orders = [];

  void addOrder(Order order) {
    orders.add(order);
    print("Order added successfully!");
  }

  void generateReport() {
    print("Sales Report: ");
    for (var order in orders) {
      order.displayOrder();
    }
  }
}
