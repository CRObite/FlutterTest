import 'dart:convert';
import 'dart:io';

class CardInfo{
  late String _title;
  late File _image;
  late bool _isFavourite;

  CardInfo(this._title, this._image, this._isFavourite);

  bool get isFavourite => _isFavourite;

  set isFavourite(bool value) {
    _isFavourite = value;
  }

  File get image => _image;

  set image(File value) {
    _image = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': _title,
      'imagePath': _image.path,
      'isFavourite': _isFavourite,
    };
  }
  factory CardInfo.fromJson(Map<String, dynamic> json) {
    return CardInfo(
      json['title'],
      File(json['imagePath']),
      json['isFavourite'],
    );
  }
}