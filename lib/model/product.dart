class Product {
  int? _id;
  dynamic _price;
  dynamic _oldPrice;
  dynamic _discount;
  String? _image;
  String? _name;
  String? _description;

  int? get id => _id;

  dynamic get price => _price;

  dynamic get oldPrice => _oldPrice;

  dynamic get discount => _discount;

  String? get image => _image;

  String? get name => _name;

  String? get description => _description;

  Product(
      {int? id,
      dynamic price,
      dynamic oldPrice,
      dynamic discount,
      String? image,
      String? name,
      String? description}) {
    _id = id;
    _price = price;
    _oldPrice = oldPrice;
    _discount = discount;
    _image = image;
    _name = name;
    _description = description;
  }

  Product.fromJson(dynamic json) {
    _id = json["id"];
    _price = json["price"];
    _oldPrice = json["old_price"];
    _discount = json["discount"];
    _image = json["image"];
    _name = json["name"];
    _description = json["description"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["price"] = _price;
    map["old_price"] = _oldPrice;
    map["discount"] = _discount;
    map["image"] = _image;
    map["name"] = _name;
    map["description"] = _description;
    return map;
  }
}
