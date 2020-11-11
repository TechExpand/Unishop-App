import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Others/search_general.dart';
import 'package:flutter_new/Widget/Widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:provider/provider.dart';



class ServiceSubCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ServiceSubCategoryState();
  }
}

class ServiceSubCategoryState extends State<ServiceSubCategory> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: Colors.white,
            drawer: Provider.of<General>(context, listen: false).drawer(context),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(
                    icon: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 35,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return SearchPage();
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
                    ),
                  ),
                )
              ],
              title: Provider.of<General>(context, listen: false).logo,
            ),
            body: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          return Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                  secondaryAnimation) {
                                return null;
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },

                        title: Text('Computer & IT Services',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          return Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                  secondaryAnimation) {
                                return null;
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },

                        title: Text('Party,Catering & Event Services',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          return Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                  secondaryAnimation) {
                                return null;
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },

                        title: Text("Health & Beauty Services",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          return Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                  secondaryAnimation) {
                                return null;
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },

                        title: Text("Fashion Services",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          return Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                  secondaryAnimation) {
                                return null;
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },

                        title: Text('Fitness & Personal Training Services',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          return Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                  secondaryAnimation) {
                                return null;
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },

                        title: Text('Logistics & Transport Services',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          return Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                  secondaryAnimation) {
                                return null;
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },

                        title: Text('Photography & Video Services',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          return Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                  secondaryAnimation) {
                                return null;
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },

                        title: Text('Repair Services',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          return Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                  secondaryAnimation) {
                                return null;
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },

                        title: Text('Class & Tutoring Service',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          return Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                  secondaryAnimation) {
                                return null;
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },

                        title: Text('Other Services',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),

              ],
            ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}