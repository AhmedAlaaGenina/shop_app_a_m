class ChangeFavoritesModel {
  bool? _status;
  String? _message;

  bool? get status => _status;

  String? get message => _message;

  ChangeFavoritesModel(
    bool? status,
    String? message,
  ) {
    _status = status;
    _message = message;
  }

  ChangeFavoritesModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
}
