
import 'dart:io';

import 'package:dart_train/CardInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'Massives.dart';


class PopUps{
  TextEditingController controller = TextEditingController();
  String status = "No selected Image";
  static File? image;

  Future<void> pickImageFromGallery() async {
    try {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    } on PlatformException catch (e) {
      print('FAILED');
    }
  }



  Future<String?> openDialog(BuildContext context, String contText) {
    TextEditingController controller = TextEditingController(text: contText);

    return showDialog<String>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('New Card'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  autofocus: true,
                  decoration: const InputDecoration(hintText: "Card Title"),
                  controller: controller,
                ),
                Text(status),
                ElevatedButton(
                  onPressed: () async {
                    await pickImageFromGallery();
                    if (image != null) {
                      setState(() {
                        status = "You selected Image";
                      });
                    }
                  },
                  child: const Text('UploadImage'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(controller.text);
                },
                child: const Text('Create'),
              ),
            ],
          );
        },
      ),
    );
  }



  void showImagePopup(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }


  void showImagePopupFromCards(File image, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }


  void deleteDialog(BuildContext context, CardInfo cardInfo) => showDialog<String>(
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Delete Card'),
              content: const Text("Delete this Card?"),

              actions: [
                TextButton(
                  onPressed: () {

                    final int cardIndex = Massives.cardInfo.indexOf(cardInfo);
                    if (cardIndex != -1) {
                      // Call the deleteCard method and remove the card by index
                      Massives().deleteCard(cardIndex);

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {Navigator.of(context).pop();},
                  child: const Text('No'),
                ),
              ],
            );
          }
      )
  );


}