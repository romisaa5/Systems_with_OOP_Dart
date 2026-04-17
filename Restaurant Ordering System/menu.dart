import 'menu_item.dart';

class Menu {
  List<MenuItem> items = [];

  void addItem(MenuItem item) {
    items.add(item);
  }

  void removeItem(String id) {
    items.removeWhere((item) => item.id == id);
  }

  MenuItem? getItemById(String id) {
    try {
      return items.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }
}
