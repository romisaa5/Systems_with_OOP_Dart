import 'dart:io';

import 'ATM.dart';
import 'bankacount.dart';
import 'transaction.dart';

void main() {
  print("🌍 اختر اللغة / Choose language:");
  print(" 1️⃣  العربية");
  print(" 2️⃣  English");
  stdout.write("👉 أدخل رقم اللغة / Enter language number: ");
  String choice = stdin.readLineSync()!;
  String language = (choice == "1") ? "ar" : "en";

  BankAccount userAccount = BankAccount(
      accountName: 'Romisaa Fadel',
      accountNumber: 101,
      accountPassword: '15917674R',
      balance: 10800);
  ATM atm = ATM(language: language);
  while (true) {
    print(language == "ar"
        ? "\n🔹 اختر العملية: \n 1️⃣  سحب  \n 2️⃣  إيداع  \n 3️⃣  استعلام عن الرصيد \n 4️⃣   خروج"
        : "\n🔹 Select operation: \n  1️⃣  Withdraw \n 2️⃣  Deposit \n  3️⃣  Check balance \n 4️⃣  Exit");
    stdout.write(language == "ar"
        ? "👉 أدخل رقم العملية: "
        : "👉 Enter operation number: ");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case "1":
        stdout.write(language == "ar"
            ? "💵 أدخل المبلغ للسحب: "
            : "💵 Enter amount to withdraw: ");
        double amount = double.parse(stdin.readLineSync()!);
        atm.performTransaction(WithdrawTransaction(amount), userAccount);
        break;
      case "2":
        stdout.write(language == "ar"
            ? "💰 أدخل المبلغ للإيداع: "
            : "💰 Enter amount to deposit: ");
        double amount = double.parse(stdin.readLineSync()!);
        atm.performTransaction(DepositTransaction(amount), userAccount);
        break;
      case "3":
        atm.performTransaction(CheckBalanceTransaction(), userAccount);
        break;
      case "4":
        print(language == "ar"
            ? "👋 شكراً لاستخدامك الـ ATM!"
            : " Thank you for using the ATM! 👋");
        return;
      default:
        print(language == "ar" ? "❌ خيار غير صالح!" : " Invalid option! ❌");
    }
  }
}
