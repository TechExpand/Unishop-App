import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Others/search_general.dart';
import 'package:flutter_new/Widget/Widgets.dart';
import 'package:provider/provider.dart';


class HealthSubCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HealthSubCategoryState();
  }
}

class HealthSubCategoryState extends State<HealthSubCategory> {
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

                        title: Text('Bath & Body',
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

                        title: Text('Hair Beauty',
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

                        title: Text("Makeup",
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

                        title: Text("Children's Shoes",
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

                        title: Text("Fragrance",
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

                        title: Text("Skin Care",
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

                        title: Text("Vitamins & Supplements",
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

