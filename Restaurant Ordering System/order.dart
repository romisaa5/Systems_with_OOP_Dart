import 'customer.dart';
import 'order_item.dart';

enum OrderStatus { pending, preparing, ready, delivered }

class Order {
  String id;
  Customer customer;
  List<OrderItem> items;
  OrderStatus status;

  Order({
    required this.id,
    required this.customer,
    required this.items,
    this.status = OrderStatus.pending,
  });

  double get totalAmount {
    return items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void addItem(OrderItem item) {
    items.add(item);
  }

  void removeItem(String itemId) {
    items.removeWhere((i) => i.item.id == itemId);
  }

  void updateStatus(OrderStatus newStatus) {
    status = newStatus;
  }
}
