
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'CardInfo.dart';

class Cart extends StatefulWidget {

  final CardInfo cardInfo;
  const Cart({Key? key, required this.cardInfo}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {



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
            Image.network(
              cardInfo.image,
              width: 300,
              height: 200,
              fit: BoxFit.cover,
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
                      ),
                      onPressed: () {
                        setState(() {
                          cardInfo.isFavourite = !cardInfo.isFavourite;
                        });
                      },
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
