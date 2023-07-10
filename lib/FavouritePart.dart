

import 'dart:io';

import 'package:flutter/material.dart';
import 'CardInfo.dart';
import 'Massives.dart';
import 'PopUps.dart';
import 'card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audioplayers.dart';

class FavouritePart extends StatefulWidget {
  const FavouritePart({super.key});

  @override
  State<FavouritePart> createState() => _FavouritePartState();
}

class _FavouritePartState extends State<FavouritePart> {

  void _handleFavoriteChanged(bool isFavorite) {
    setState(() {
      // Ничего не нужно делать здесь, поскольку виджет будет перестроен при вызове setState()
    });
  }

  void _handleCardDeleted(bool deleted) {
    setState(() {
      // Обновление состояния после удаления карточки
    });
  }

  final List<CardInfo> cardInfo = Massives().getCards();
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {

    if(!(cardInfo.any((element) => element.isFavourite))){
      return Center(
        child: GestureDetector(
          onTap: (){
            PopUps().showImagePopup(context, 'assets/bankai.jpg');

            player.play(AssetSource('urahara-bankai.mp3'));
            Fluttertoast.showToast(
                msg: "Банкай.Каннонбираки Бенихиме Аратаме",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          },
          child: const Text(
            'No Favourite Image',
            style: TextStyle(
              fontSize: 20, // Increase the font size to your desired value
            ),
          ),
        ),
      );
    }
    else{
      return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: cardInfo.length,
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (BuildContext context, int index){
                    if(cardInfo[index].isFavourite){
                      return Cart(cardInfo: cardInfo[index],onFavoriteChanged: _handleFavoriteChanged, onCardDeleted: _handleCardDeleted);
                    }else{
                      return Container();
                    }
                  }
              ),
            ),
          ],
        ),
      );
    }



  }






}
