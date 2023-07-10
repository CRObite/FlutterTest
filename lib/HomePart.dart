


import 'package:dart_train/Massives.dart';
import 'package:dart_train/card.dart';
import 'package:flutter/material.dart';


import 'CardInfo.dart';
import 'PopUps.dart';

class HomePart extends StatefulWidget {

  const HomePart({super.key});


  @override
  State<HomePart> createState() => _HomePartState();
}
class _HomePartState extends State<HomePart> {



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



  late TextEditingController controller;
  String title = '';

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  final List<CardInfo> cardInfo = Massives().getCards();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: cardInfo.length,
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (BuildContext context, int index){
                    return Cart(cardInfo: cardInfo[index],onFavoriteChanged: _handleFavoriteChanged, onCardDeleted: _handleCardDeleted);
                  }
              ),
          ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () async {
                  final title = await PopUps().openDialog(context,"");


                  if(title == null || title.isEmpty) return;
                  setState(() => this.title = title);

                  Massives().addCard(title, PopUps.image!);


                },

              child: const Icon(Icons.add)),
        ],
      ),
    );
  }





}
