import 'menu_item.dart';

class OrderItem {
  MenuItem item;
  int quantity;

  OrderItem({required this.item, required this.quantity});

  double get totalPrice => item.price * quantity;
}
