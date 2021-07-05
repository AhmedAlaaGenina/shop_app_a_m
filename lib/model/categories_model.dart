/// status : true
/// message : null
/// data : {"current_page":1,"data":[{"id":35,"name":"افضل العروض","image":"https://student.valuxapps.com/storage/uploads/categories/161950183360VJK.best-offer-sale-banner-vector.jpg"},{"id":20,"name":"إلكترونيات","image":"https://student.valuxapps.com/storage/uploads/categories/1618882951tlW17.jelec.png"},{"id":36,"name":"مكافحة كورونا","image":"https://student.valuxapps.com/storage/uploads/categories/1620252583PBo9f.2515-2050_l.png"},{"id":26,"name":"سوبر ماركت","image":"https://student.valuxapps.com/storage/uploads/categories/1618883074tPenb.super.png"},{"id":23,"name":"ألعاب","image":"https://student.valuxapps.com/storage/uploads/categories/1618883450k3M7u.toys.png"},{"id":21,"name":"رياضة","image":"https://student.valuxapps.com/storage/uploads/categories/1618883220mfCzZ.sports.png"},{"id":27,"name":"اغذيه ومأكولات طازجه","image":"https://student.valuxapps.com/storage/uploads/categories/1619502074w3Zie.rau-cu-qua.png"},{"id":28,"name":"الجوالات","image":"https://student.valuxapps.com/storage/uploads/categories/16188818430X9HL.mobiles.png"},{"id":22,"name":"الأمهات و الأطفال","image":"https://student.valuxapps.com/storage/uploads/categories/1615410392yMTiT.mom-baby-620.jpeg"},{"id":30,"name":"اجهزة الحاسوب","image":"https://student.valuxapps.com/storage/uploads/categories/1618882598N1fY8.lap.png"},{"id":33,"name":"إكسسورات","image":"https://student.valuxapps.com/storage/uploads/categories/1620606629L48c8.download (5).jpg"},{"id":32,"name":"المطبخ","image":"https://student.valuxapps.com/storage/uploads/categories/1618882686kdWs3.kit.png"},{"id":24,"name":"أجهزة منزلية","image":"https://student.valuxapps.com/storage/uploads/categories/1618882488Cg3GE.applia.png"}],"first_page_url":"https://student.valuxapps.com/api/categories?page=1","from":1,"last_page":1,"last_page_url":"https://student.valuxapps.com/api/categories?page=1","next_page_url":null,"path":"https://student.valuxapps.com/api/categories","per_page":35,"prev_page_url":null,"to":13,"total":13}

class CategoriesModel {
  bool? _status;
  dynamic? _message;
  Data? _data;

  bool? get status => _status;
  dynamic? get message => _message;
  Data? get data => _data;

  CategoriesModel({bool? status, dynamic? message, Data? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  CategoriesModel.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data?.toJson();
    }
    return map;
  }
}

/// current_page : 1
/// data : [{"id":35,"name":"افضل العروض","image":"https://student.valuxapps.com/storage/uploads/categories/161950183360VJK.best-offer-sale-banner-vector.jpg"},{"id":20,"name":"إلكترونيات","image":"https://student.valuxapps.com/storage/uploads/categories/1618882951tlW17.jelec.png"},{"id":36,"name":"مكافحة كورونا","image":"https://student.valuxapps.com/storage/uploads/categories/1620252583PBo9f.2515-2050_l.png"},{"id":26,"name":"سوبر ماركت","image":"https://student.valuxapps.com/storage/uploads/categories/1618883074tPenb.super.png"},{"id":23,"name":"ألعاب","image":"https://student.valuxapps.com/storage/uploads/categories/1618883450k3M7u.toys.png"},{"id":21,"name":"رياضة","image":"https://student.valuxapps.com/storage/uploads/categories/1618883220mfCzZ.sports.png"},{"id":27,"name":"اغذيه ومأكولات طازجه","image":"https://student.valuxapps.com/storage/uploads/categories/1619502074w3Zie.rau-cu-qua.png"},{"id":28,"name":"الجوالات","image":"https://student.valuxapps.com/storage/uploads/categories/16188818430X9HL.mobiles.png"},{"id":22,"name":"الأمهات و الأطفال","image":"https://student.valuxapps.com/storage/uploads/categories/1615410392yMTiT.mom-baby-620.jpeg"},{"id":30,"name":"اجهزة الحاسوب","image":"https://student.valuxapps.com/storage/uploads/categories/1618882598N1fY8.lap.png"},{"id":33,"name":"إكسسورات","image":"https://student.valuxapps.com/storage/uploads/categories/1620606629L48c8.download (5).jpg"},{"id":32,"name":"المطبخ","image":"https://student.valuxapps.com/storage/uploads/categories/1618882686kdWs3.kit.png"},{"id":24,"name":"أجهزة منزلية","image":"https://student.valuxapps.com/storage/uploads/categories/1618882488Cg3GE.applia.png"}]
/// first_page_url : "https://student.valuxapps.com/api/categories?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "https://student.valuxapps.com/api/categories?page=1"
/// next_page_url : null
/// path : "https://student.valuxapps.com/api/categories"
/// per_page : 35
/// prev_page_url : null
/// to : 13
/// total : 13

class Data {
  int? _currentPage;
  List<DataInSide>? _data;
  String? _firstPageUrl;
  int? _from;
  int? _lastPage;
  String? _lastPageUrl;
  dynamic? _nextPageUrl;
  String? _path;
  int? _perPage;
  dynamic? _prevPageUrl;
  int? _to;
  int? _total;

  int? get currentPage => _currentPage;
  List<DataInSide>? get dataInSide => _data;
  String? get firstPageUrl => _firstPageUrl;
  int? get from => _from;
  int? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  dynamic? get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  int? get perPage => _perPage;
  dynamic? get prevPageUrl => _prevPageUrl;
  int? get to => _to;
  int? get total => _total;

  Data(
      {int? currentPage,
      List<DataInSide>? data,
      String? firstPageUrl,
      int? from,
      int? lastPage,
      String? lastPageUrl,
      dynamic? nextPageUrl,
      String? path,
      int? perPage,
      dynamic? prevPageUrl,
      int? to,
      int? total}) {
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
  }

  Data.fromJson(dynamic json) {
    _currentPage = json["current_page"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data?.add(DataInSide.fromJson(v));
      });
    }
    _firstPageUrl = json["first_page_url"];
    _from = json["from"];
    _lastPage = json["last_page"];
    _lastPageUrl = json["last_page_url"];
    _nextPageUrl = json["next_page_url"];
    _path = json["path"];
    _perPage = json["per_page"];
    _prevPageUrl = json["prev_page_url"];
    _to = json["to"];
    _total = json["total"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["current_page"] = _currentPage;
    if (_data != null) {
      map["data"] = _data?.map((v) => v.toJson()).toList();
    }
    map["first_page_url"] = _firstPageUrl;
    map["from"] = _from;
    map["last_page"] = _lastPage;
    map["last_page_url"] = _lastPageUrl;
    map["next_page_url"] = _nextPageUrl;
    map["path"] = _path;
    map["per_page"] = _perPage;
    map["prev_page_url"] = _prevPageUrl;
    map["to"] = _to;
    map["total"] = _total;
    return map;
  }
}

/// id : 35
/// name : "افضل العروض"
/// image : "https://student.valuxapps.com/storage/uploads/categories/161950183360VJK.best-offer-sale-banner-vector.jpg"

class DataInSide {
  int? _id;
  String? _name;
  String? _image;

  int? get id => _id;
  String? get name => _name;
  String? get image => _image;

  DataInSide({int? id, String? name, String? image}) {
    _id = id;
    _name = name;
    _image = image;
  }

  DataInSide.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["image"] = _image;
    return map;
  }
}
