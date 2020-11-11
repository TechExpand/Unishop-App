import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_new/Widget/Widgets.dart';
import 'package:flutter_new/services/network.dart';
import 'package:flutter_new/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
var edithpropicresponse;
class EditProfilePic extends StatefulWidget {
  var username;
  EditProfilePic(this.username);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditProfilePicState();
  }
}

class EditProfilePicState extends State<EditProfilePic> {
  final formkey = GlobalKey<FormState>();
  List data;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        drawer: Provider.of<General>(context, listen: false).drawer(context),
        appBar: Provider.of<General>(context, listen: false).appbar(context),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 170,
                      height: 170,
                      child: Provider.of<Utils>(context, listen: false).image == null
                          ? Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('No Image Selected'),
                              ),
                              Icon(Icons.camera_alt)
                            ],
                          ))
                          : Image.file(
                       Provider.of<Utils>(context, listen: false).image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          onPressed: () {
                            Provider.of<Utils>(context, listen: false).selectimage();
                          },
                          child: Text(
                            'Select profile pic',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 30,
                        width: 140,
                        child: RaisedButton(
                          color: Colors.lightGreen,
                          onPressed: () {
                            if (formkey.currentState.validate()) {
                              Provider.of<Network>(context, listen: false).UploadFile(image:Provider.of<Utils>(context, listen: false).image, username:widget.username, context:context);
                              Provider.of<Utils>(context, listen: false).circular(context);
                            }
                          },
                          child: Text(
                            'update profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
