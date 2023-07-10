

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'FavouritePart.dart';
import 'HomePart.dart';



class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  int selectedIndex = 0;
  final PageController _pageController = PageController();


  void handleTabChange(int index) {
    setState(() {
      selectedIndex = index;
      _pageController.jumpToPage(selectedIndex);
    });
  }
  void swipeChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Fluttertoast.showToast(
                msg: " Ищи в другом месте ) Бугагагагага",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          },
          icon: const Icon(Icons.title),
        ),
        title: const Text("Tiles & Pictures"),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: swipeChange,
        children: const [
          HomePart(),
          FavouritePart(),
        ],
      ),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 20),
          child: GNav(
            gap: 8,
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            selectedIndex: selectedIndex,
            tabBackgroundColor: Colors.white30,
            onTabChange: (index) => {handleTabChange(index)},
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorite',
              ),
            ],
          ),
        ),
      ),
    );
  }



}