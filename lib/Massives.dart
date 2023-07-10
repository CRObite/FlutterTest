import 'dart:io';

import 'package:dart_train/storageCards.dart';

import 'CardInfo.dart';

class Massives {
  static List<CardInfo> cardInfo = <CardInfo>[];

  void addCard(String cardTitle, File imagePath){
    cardInfo.add(CardInfo(cardTitle, imagePath, false));
    save();
  }

  void deleteCard(int index){
    if (index >= 0 && index < cardInfo.length) {
      cardInfo.removeAt(index);
    }
    save();
  }

  List<CardInfo> getCards(){
    return cardInfo;
  }

  void setCards(List<CardInfo> list){
    cardInfo = list;
  }

  void updateCard(int index,CardInfo newCard){
    cardInfo[index] = newCard;
    save();
  }

  Future<void> save() async {
    await StorageCards.saveCardInfoList(Massives().getCards());
  }



}