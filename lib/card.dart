

import 'package:dart_train/storageCards.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'CardInfo.dart';
import 'Massives.dart';
import 'PopUps.dart';

class Cart extends StatefulWidget {

  final CardInfo cardInfo;
  final Function(bool) onFavoriteChanged;
  final Function(bool) onCardDeleted;

  const Cart({Key? key, required this.cardInfo, required this.onFavoriteChanged, required this.onCardDeleted}) : super(key: key);



  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  String title = '';
  @override
  Widget build(BuildContext context) {

    final CardInfo cardInfo = widget.cardInfo;

    return Card(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap:(){
                 PopUps().showImagePopupFromCards(cardInfo.image, context);
                },
                child: Image.file(
                  cardInfo.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.album),
                title: Text(cardInfo.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(DateFormat('dd-MM-yyyy').format(DateTime.now())),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Builder(
                      builder: (BuildContext context) => IconButton(
                        icon: Icon(
                          cardInfo.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                          size: 30,

                        ),
                        onPressed: () {
                          setState(() {
                            cardInfo.isFavourite = !cardInfo.isFavourite;
                          });
                          widget.onFavoriteChanged(cardInfo.isFavourite);
                          save();
                        },

                      )
                  ),

                  IconButton
                    (onPressed: () {
                    PopUps().deleteDialog(context, widget.cardInfo);
                    widget.onCardDeleted(true);
                  },
                    icon: const Icon(Icons.delete,
                        color: Colors.grey,
                        size: 30),
                  ),

                  IconButton
                    (onPressed: () async {
                      final title = await PopUps().openDialog(context, cardInfo.title);
                      if(title == null || title.isEmpty) return;
                      setState(() => this.title = title);
                      final int cardIndex = Massives.cardInfo.indexOf(widget.cardInfo);
                      Massives().updateCard(cardIndex,CardInfo(title, PopUps.image!,cardInfo.isFavourite));
                      widget.onCardDeleted(true);
                    },
                    icon: const Icon(Icons.edit,
                        color: Colors.grey,
                        size: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }



  Future<void> save() async {
    await StorageCards.saveCardInfoList(Massives().getCards());
  }


}
