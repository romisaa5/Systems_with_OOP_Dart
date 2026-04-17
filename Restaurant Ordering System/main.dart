import 'customer.dart';
import 'menu_item.dart';
import 'order.dart';
import 'order_item.dart';
import 'payment.dart';
import 'restaurant.dart';

void main() {
  var restaurant = Restaurant(name: "My Restaurant");

  var burger = MenuItem(id: "1", name: "Burger", price: 50, category: "Food");
  var pizza = MenuItem(id: "2", name: "Pizza", price: 80, category: "Food");

  restaurant.menu.addItem(burger);
  restaurant.menu.addItem(pizza);

  var customer = Customer(id: "c1", name: "Romisah", phone: "01000000000");

  var order = Order(
    id: "o1",
    customer: customer,
    items: [
      OrderItem(item: burger, quantity: 2),
      OrderItem(item: pizza, quantity: 1),
    ],
  );

  restaurant.addOrder(order);

  print("Total: ${order.totalAmount}");

  var payment = CashPayment(order.totalAmount);
  payment.processPayment();
}
