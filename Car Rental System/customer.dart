class Customer {
  final String name;
  final String phone;

  Customer(this.name, this.phone);

  void displayInfoCustomer() {
    print("Customer's Name: $name, Phone: $phone");
  }
}