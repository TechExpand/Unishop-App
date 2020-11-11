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
var edithprofileresponse;
class EditProfile extends StatefulWidget {
  var profiledata;
  EditProfile(this.profiledata);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditProfileState();
  }
}

class EditProfileState extends State<EditProfile> {
  final formkey = GlobalKey<FormState>();
  var groupvalue;
  var username;
  var firstname;
  var lastname;
  var bio;
  var pic;
  var businessname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Provider.of<General>(context, listen: false).drawer(context),
        appBar: Provider.of<General>(context, listen: false).appbar(context),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        initialValue: widget.profiledata['username'],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Username is Required';
                          } else {
                            username = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'username',
                            labelStyle: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.title,
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        initialValue: widget.profiledata['first_name'],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'First name is Required';
                          } else {
                            firstname = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'First name',
                            labelStyle: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.description,
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        initialValue: widget.profiledata['last_name'],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Last name is Required';
                          } else {
                            lastname = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Last name',
                            labelStyle: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.attach_money,
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        initialValue: widget.profiledata['bio'],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Business Bio is Required';
                          } else {
                            bio = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Business Bio',
                            labelStyle: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.school,
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        initialValue: widget.profiledata['businessname'],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Business name is Required';
                          } else {
                            businessname = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Business name',
                            labelStyle: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.call,
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),

                  Container(
                    width: 170,
                    height: 170,
                    child: Provider.of<Utils>(context, listen: false).image == null
                        ? Center(child: Text('No Image Selected'))
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
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                            Provider.of<Network>(context, listen: false).UploadFile(image:Provider.of<Utils>(context, listen: false).image, username:username,context: context);
                            Provider.of<Utils>(context, listen: false).circular(context);
                          }
                        },
                        child: Text(
                          'update profile',
                          style: TextStyle(
                              color: Colors.black87,
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
      );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
