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

var edithrequestresponse;

class EditRequest extends StatefulWidget {
  var index;
  var userrequestdata;
  EditRequest(this.index, this.userrequestdata);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditRequestState();
  }
}

class EditRequestState extends State<EditRequest> {
  final formkey = GlobalKey<FormState>();
  var groupvalue;
  var description;
  var school;
  var number;
  var email;

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        initialValue: widget.userrequestdata[widget.index]['request_description'],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Request description is Required';
                          } else {
                            description = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Request description',
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
                        initialValue: widget.userrequestdata[widget.index]['phone'],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Phone is Required';
                          } else {
                            number = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Phone',
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
                        initialValue: widget.userrequestdata[widget.index]['email'],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email is Required';
                          } else {
                            email = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Email',
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
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: 30,
                      width: 100,
                      child: RaisedButton(
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                            Provider.of<Network>(context, listen: false).UploadRequestFile(description:description,number: number,email: email,context: context);
                            Provider.of<Utils>(context, listen: false).circular(context);
                          }
                        },
                        child: Text(
                          'update',
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
