
import 'package:dart_train/Massives.dart';
import 'package:dart_train/storageCards.dart';
import 'package:flutter/material.dart';
import 'CardInfo.dart';
import 'homepage.dart';

main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    load().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      // Show a loading indicator while data is being loaded
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        ),
      );
    } else {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    }
  }
}


Future<void> load() async {

  List<CardInfo> cardInfoList = await StorageCards.loadCardInfoList();
  Massives().setCards(cardInfoList);

}



