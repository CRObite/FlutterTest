class CardInfo{
  late String _title;
  late String _image;
  late bool _isFavourite;

  CardInfo(this._title, this._image, this._isFavourite);

  bool get isFavourite => _isFavourite;

  set isFavourite(bool value) {
    _isFavourite = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}