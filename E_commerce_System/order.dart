import 'products.dart';
import 'user.dart';

enum OrderStatus { pending, shipped, delivered, canceled }

class Order {
  static int _idCounter = 1; 
  final int id;
  final Customer customer;
  List<Product> products;
  double totalPrice;
  OrderStatus status;
  final DateTime orderDate;

  Order(this.customer, this.products, {this.status = OrderStatus.pending})
      : id = _idCounter++,
        orderDate = DateTime.now(),
        totalPrice = _calculateTotal(products);

  static double _calculateTotal(List<Product> products) {
  double total = 0;
  for (var product in products) {
    total += product.price;
  }
  return total;
}

  void updateTotal() {
    totalPrice = _calculateTotal(products);
  }

    void addProduct(Product product) {
    products.add(product);
    updateTotal();
    print("🛒 Product ${product.name} added to Order #$id.");
  }

    void removeProduct(Product product) {
    products.remove(product);
    updateTotal();
    print("❌ Product ${product.name} removed from Order #$id.");
  }
   void updateStatus(OrderStatus newStatus) {
     if (status == OrderStatus.delivered) {
      print("⚠️ Cannot change status of a delivered order.");
      return;
    }
    status = newStatus;
    print("🔄 Order #$id status updated to ${status.name}.");
  }
   void displayOrder() {
    print("\n📦 Order Details");
    print("--------------------------");
    print("🆔 Order ID: $id");
    print("👤 Customer: ${customer.username}");
    print("📅 Date: ${orderDate.toLocal()}");
    print("📜 Status: ${status.name.toUpperCase()}");
    print("💰 Total Price: \$${totalPrice.toStringAsFixed(2)}");
    print("📦 Products:");
    for (var product in products) {
      print("   - ${product.name} (\$${product.price.toStringAsFixed(2)})");
    }
    print("--------------------------\n");
  }
}

class OrderManager {
  final List<Order> _orders = [];
  
  void addOrder(Order order) {
    _orders.add(order);
    print("✅ Order #${order.id} added successfully.");
  }

  void removeOrder(Order order) {
    _orders.remove(order);
    print("❌ Order #${order.id} removed.");
  }

  void displayAllOrders() {
    if (_orders.isEmpty) {
      print("🚫 No orders found.");
    } else {
      print("\n📦 All Orders:");
      for (var order in _orders) {
        order.displayOrder();
      }
    }
  }
}
