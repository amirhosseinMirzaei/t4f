class Product {
  String? type;
  String? title;
  String? image;
  String? price;
  String? city;
  String? presenter;
  String? runtime;
  String? rate;
  String? url;
  String? id;

  Product({this.type, this.title, this.image, this.price, this.city, this.presenter, this.runtime, this.rate, this.url, this.id});

  Product.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    city = json['city'];
    presenter = json['presenter'];
    runtime = json['runtime'];
    rate = json['rate'];
    url = json['url'];
    id = json['id'];
  }
}
