import 'package:flutter/material.dart';
import 'package:flutter_new/Widget/Widgets.dart';
import 'package:flutter_new/services/network.dart';
import 'package:flutter_new/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../Widget/Widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_new/screen/login_signup/Login.dart';

var response;

class PostDeal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostDealState();
  }
}

class PostDealState extends State<PostDeal> {
  final form_key = GlobalKey<FormState>();
  var email;
  var businessname;
  var username;
  var bio;
  var first_name;
  var last_name;
  var password;
  var re_password;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: SweepGradient(startAngle: 0.7, colors: [
                  Colors.greenAccent,
                  Colors.lightGreen,
                  Colors.greenAccent
                ]),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.width / 13,
                left: MediaQuery.of(context).size.width / 25,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })),
          ListView(
            children: <Widget>[
               Container(
              child: Column(
                children: <Widget>[
                  Divider(),
                  Provider.of<General>(context, listen: false).logo,
                  Divider(),
                ],
              ),
              padding:
                  EdgeInsets.only(top: 50),
            ),
            Container(
              child: Form(
                key: form_key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 450,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email Required';
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    Padding(
                     padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 450,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Username Required';
                            } else {
                              username = value;
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              icon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                                        Padding(
                     padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 450,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'First Name Required';
                            } else {
                              first_name = value;
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'First Name',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              icon: Icon(
                                Icons.title,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                                        Padding(
                     padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 450,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Last Name Required';
                            } else {
                              last_name = value;
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Last Name',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              icon: Icon(
                                Icons.title,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                    Padding(
                     padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 450,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Bio Required';
                            } else {
                              bio = value;
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Bio',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              icon: Icon(
                                Icons.details,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                    Padding(
                     padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 450,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Business Name Required';
                            } else {
                              businessname = value;
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Business Name',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              icon: Icon(
                                Icons.business,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                                        Padding(
                     padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 450,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password Required';
                            } else {
                              password = value;
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                                        Padding(
                     padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 450,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Retype PassWord Required';
                            } else {
                              re_password = value;
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Retype PassWord',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(18),
                    child: Container(
                      decoration: BoxDecoration(
                                                color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      width: 150,
                      height: 40,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Provider.of<Utils>(context, listen: false).selectimage();
                          },
                          child: Text(
                            'Select Profile Image',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    child: Provider.of<Utils>(context, listen: false).image == null
                        ? Center(child: Text('No Image Selected'))
                        : Image.file(
                            Provider.of<Utils>(context, listen: true).image,
                            fit: BoxFit.contain,
                          ),
                  ),
                  ],
                ),
              ),
              padding: EdgeInsets.only(
                  top: 30),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 5),
              child: Text('You are Becoming a Merchant',
              textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Login();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Text('Already Signup? Click here to Login',
                textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20),
              child: InkWell(
                onTap: () {
                  if (form_key.currentState.validate()) {
                  Provider.of<Network>(context, listen: false).signup(
                    bio: bio,
                    image: Provider.of<Utils>(context, listen: false).image,
                    businessname: businessname,
                    username: username,
                    last_name: last_name,
                    first_name: first_name,
                    email:email,
                     password:password,
                      context:context,
                      re_password: re_password,
                    );
                    Provider.of<Utils>(context, listen: false).circular(context);
                  }
                },
                child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      width: 100,
                      height: 40,
                      child: Center(
                          child: Text('Submit',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)))),
                ),
              ),
            )
            ],
          )
          ],
        ),
      );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
