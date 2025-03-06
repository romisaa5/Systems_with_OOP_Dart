

import 'products.dart';

class Cart {
  final List<Product> _items = [];
  double _totalPrice = 0;
   final int userId;
     Cart(this.userId);
       List<Product> get items => List.unmodifiable(_items); 
  double get totalPrice => _totalPrice;
  void _calculateTotal() {
  double total = 0;
  for (var item in _items) {
    total += item.price * item.quantity;
  }
  _totalPrice = total;
}

  void addItem(Product product) {
    _items.add(product);
    _calculateTotal();
    print("✅ Added ${product.name} to the cart.");
  }

  void removeItem(Product product) {
    if (_items.remove(product)) {
      _calculateTotal();
      print("❌ Removed ${product.name} from the cart.");
    } else {
      print("⚠️ Product not found in the cart.");
    }
  }
  
  void displayCart() {
    if (_items.isEmpty) {
      print("🛒 Cart is empty.");
      return;
    }
    print("\n🛍️ Shopping Cart:");
    for (var product in _items) {
      print("  - ${product.name} (\$${product.price.toStringAsFixed(2)}) x ${product.quantity}");
    }
    print("💰 Total: \$${_totalPrice.toStringAsFixed(2)}\n");
  }
}
