import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Others/search_general.dart';
import 'package:flutter_new/Widget/Widgets.dart';
import 'package:provider/provider.dart';



class FoodSubCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FoodSubCategoryState();
  }
}

class FoodSubCategoryState extends State<FoodSubCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                        title: Text('Meals and Drinks',
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

                        title: Text('Snacks',
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

                        title: Text("Livestock and Poultry",
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

                        title: Text("Feeds & Supplements",
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


