
import 'customer.dart';
import 'order.dart';
import 'product.dart';
import 'sales_manager.dart';

void main() {
  Product p1 = Product(1, "Laptop", 1200.0, 10);
  Product p2 = Product(2, "Phone", 800.0, 5);

  Customer c1 = Customer(101, "Ahmed", "ahmed@gmail.com");

  Order o1 = Order(1001, c1, [p1, p2]);

  SalesManager manager = SalesManager();
  manager.addOrder(o1);

  manager.generateReport();
}
