
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