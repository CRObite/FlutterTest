import 'dart:convert';

import 'CardInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StorageCards{
  static const _storageKey = 'card_info_list';

  static Future<List<CardInfo>> loadCardInfoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonStringList = prefs.getStringList(_storageKey);

    print('loaded');

    if (jsonStringList != null) {
      List<CardInfo> cardInfoList = jsonStringList
          .map((jsonString) => CardInfo.fromJson(json.decode(jsonString)))
          .toList();
      return cardInfoList;
    }

    return [];
  }


  static Future<void> saveCardInfoList(List<CardInfo> cardInfoList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonStringList = cardInfoList.map((cardInfo) => json.encode(cardInfo.toJson())).toList();
    print('saved');
    await prefs.setStringList(_storageKey, jsonStringList);
  }
}