class Product {
  static int _idCounter = 1; 
  final int id;
  double _price;
  String name;
  String description;
  int _quantity;


  Product(this.name, this._price, this.description, this._quantity)
      : id = _idCounter++;

 
  double get price => _price;
  int get quantity => _quantity;


  set price(double newPrice) {
    if (newPrice > 0) {
      _price = newPrice;
    } else {
      print("❌ Error: Price must be greater than 0.");
    }
  }

  set quantity(int newQuantity) {
    if (newQuantity >= 0) {
      _quantity = newQuantity;
    } else {
      print("❌ Error: Quantity can't be negative.");
    }
  }


  bool isAvailable() {
    return _quantity > 0;
  }

  
  void updateProduct({String? newName, String? newDescription, double? newPrice, int? newQuantity}) {
    if (newName != null) name = newName;
    if (newDescription != null) description = newDescription;
    if (newPrice != null && newPrice > 0) _price = newPrice;
    if (newQuantity != null && newQuantity >= 0) _quantity = newQuantity;
    
    print("✅ Product updated successfully!");
  }

  void displayProduct() {
    print("\n🛒 Product Details");
    print("--------------------------");
    print("📌 ID: $id");
    print("📌 Name: $name");
    print("📖 Description: $description");
    print("💰 Price: \$$_price");
    print("📦 Quantity: $_quantity");
    print("✅ Available: ${isAvailable() ? "Yes" : "No"}");
    print("--------------------------\n");
  }
}
