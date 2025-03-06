import 'store.dart';
import 'products.dart';
import 'user.dart';
import 'order.dart';
import 'cart.dart';
import 'payment.dart';

void main() {
  // إنشاء المتجر
  Store myStore = Store();

  // إنشاء منتجات
  Product product1 = Product("Laptop", 1200.0, "High-performance laptop", 5);
  Product product2 = Product("Phone", 800.0, "Latest smartphone", 10);
  Product product3 = Product("Headphones", 150.0, "Noise-canceling headphones", 7);

  // إضافة منتجات للمتجر
  myStore.addProduct(product1);
  myStore.addProduct(product2);
  myStore.addProduct(product3);

  //  (بائع وعميل)
  Seller seller = Seller("SellerOne", "password123", "seller@example.com", "123 Street");
  Customer customer = Customer("CustomerOne", "custpass123", "customer@example.com", "456 Avenue");

  // تسجيل المستخدمين في المتجر
  myStore.registerUser(seller);
  myStore.registerUser(customer);

  // البائع يضيف المنتجات 
  seller.addProduct(product1);
  seller.addProduct(product2);

  // العميل يضيف منتجات إلى سلة المشتريات
  Cart customerCart = Cart(customer.id);
  customerCart.addItem(product1);
  customerCart.addItem(product2);
  customerCart.displayCart();

  // إنشاء طلب جديد للعميل
  Order newOrder = Order(customer, customerCart.items);
  myStore.placeOrder(newOrder);
  newOrder.displayOrder();

  // تحديث حالة الطلب
  newOrder.updateStatus(OrderStatus.shipped);
  newOrder.updateStatus(OrderStatus.delivered);

  // الدفع باستخدام البطاقة الائتمانية
  Payment paymentMethod = CreditCardPayment();
  paymentMethod.pay(newOrder.totalPrice);

  // عرض المنتجات والطلبات المسجلة في المتجر
  myStore.displayProducts();
}
