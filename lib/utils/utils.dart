import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utils with ChangeNotifier{
  List data;
   File image;
  File image1;
  File image2;

  Future selectimage() async {
    var images = await ImagePicker.pickImage(source: ImageSource.gallery);
    image = images;
      notifyListeners();
  }




  Future selectimage1() async {
    var images = await ImagePicker.pickImage(source: ImageSource.gallery);
    image1 = images;
    notifyListeners();
  }



  Future selectimage2() async {
    var images = await ImagePicker.pickImage(source: ImageSource.gallery);
    image2 = images;
    notifyListeners();
  }





circular(context) {
      return showDialog(
        context: context,
        child: Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 70,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
              ),
            ),
          ),
        ),
      );
    }

}

