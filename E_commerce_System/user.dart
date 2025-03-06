import 'products.dart';

abstract class User {
  static int _idCounter = 1;
  final int id;
  String _username;
  String _password;
  String _email;
  String _address;

  User(this._username, this._password, this._email, this._address)
      : id = _idCounter++; 

  String get username => _username;
  String get email => _email;
  String get address => _address;
  String get password => _password;

 
  set password(String newPassword) {
    if (newPassword.length >= 8) {
      _password = newPassword;
    } else {
      print(" Error: Password must be at least 8 characters long.❌");
    }
  }

  
  bool login(String enteredEmail, String enteredPassword) {
    return email == enteredEmail && password == enteredPassword;
  }

  
  void displayInfo() {
    print("🔹 ID: $id\n🔹 Username: $_username\n🔹 Email: $_email\n🔹 Address: $_address");
  }
}


class Customer extends User {
  Customer(super.username, super.password, super.email, super.address);
}


class Seller extends User {
  List<Product> productList = [];

  Seller(super.username, super.password, super.email, super.address);

  
  void addProduct(Product product) {
    productList.add(product);
    print("✅ Product '${product.name}' added successfully.");
  }


  void removeProduct(String productName) {
    productList.removeWhere((product) => product.name == productName);
    print("❌ Product '$productName' removed.");
  }


  void displayProducts() {
    if (productList.isEmpty) {
      print("⚠ No products available.");
    } else {
      print("📦 Seller's Products:");
      for (var product in productList) {
        print("- ${product.name} (\$${product.price})");
      }
    }
  }
}
