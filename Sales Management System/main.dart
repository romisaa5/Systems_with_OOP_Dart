class Product {
  int productId;
  String productName;
  double productPrice;
  int productStock;
  Product(
      this.productId, this.productName, this.productPrice, this.productStock);

  int updateStock(int quantity) {
    productStock -= quantity;
    return productStock;
  }
}

class Customer {
  int customerId;
  String customerName;
  String email;
  Customer(this.customerId, this.customerName, this.email);

  void displayInfo() {
    print(
        "Customer's Name: $customerName, Customer's Id: $customerId, Email: $email");
  }
}

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

void main() {
  Product p1 = Product(1, "Laptop", 1200.0, 10);
  Product p2 = Product(2, "Phone", 800.0, 5);

  Customer c1 = Customer(101, "Ahmed", "ahmed@example.com");

  Order o1 = Order(1001, c1, [p1, p2]);

  SalesManager manager = SalesManager();
  manager.addOrder(o1);

  manager.generateReport();
}
