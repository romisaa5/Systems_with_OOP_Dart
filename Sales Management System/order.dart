import 'customer.dart';
import 'product.dart';

class Order {
  int orderId;
  Customer customer;
  List<Product> products;
  double totalPrice = 0;

  Order(this.orderId, this.customer, this.products) {
    calculateTotal();
  }

  void calculateTotal() {
    for (var product in products) {
      totalPrice += product.productPrice;
    }
  }


  void displayOrder() {
    print("Order ID: $orderId");
    print("Customer: ${customer.customerName}");
    print("Products:");
    for (var product in products) {
      print("- ${product.productName} (\$${product.productPrice})");
    }
    print("Total Price: \$${totalPrice}");
  }
}