import 'package:dart_train/card.dart';
import 'package:flutter/material.dart';

import 'CardInfo.dart';

class HomePart extends StatefulWidget {
  const HomePart({super.key});

  @override
  State<HomePart> createState() => _HomePartState();
}



class _HomePartState extends State<HomePart> {

  final List<CardInfo> cardInfo = <CardInfo>[];

  void addCard(){
    setState(() {
      cardInfo.add(CardInfo('Iam ERROR', 'https://hips.hearstapps.com/hmg-prod/images/nature-quotes-landscape-1648265299.jpg', false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: cardInfo.length,
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (BuildContext context, int index){
                    return Cart(cardInfo: cardInfo[index]);
                  }
              ),
          ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () {addCard();},
              child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
