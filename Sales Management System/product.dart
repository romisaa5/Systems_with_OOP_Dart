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