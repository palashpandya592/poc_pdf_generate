import 'dart:ui';

class Invoice {
  final String customer;
  final String address;
  final String name;
  final String img;
  final List<LineItem> items;
  Invoice({
    required this.customer,
    required this.address,
    required this.items,
    required this.name,
    required this.img,
  });
  double totalCost() {
    return items.fold(
        0, (previousValue, element) => previousValue + element.cost);
  }
}

class ImgData {
  final String imgurl;

  ImgData.name({required this.imgurl});
}

class LineItem {
  final String description;
  final double cost;

  LineItem(this.description, this.cost);
}
