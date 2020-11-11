import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widget/Widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


List search_request_data;
var search_request_value;
var searchpage_request_Index;

class Search_RequestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Search_RequestPageState();
  }
}

class Search_RequestPageState extends State<Search_RequestPage> {
  Future searchget() async {
    var res = await http.get(
        Uri.encodeFull(
            'http://192.168.43.231:8000/shop/requestapi/?search=${search_request_value}'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Token ab3802e3a5657660e52eeff04cd3ad1f4775efba"
        });
    this.setState(() {
      search_request_data = json.decode(res.body);
    });

    return search_request_data;
  }

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
              child:  IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Search_RequestPage();
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

          ],
          title: Provider.of<General>(context, listen: false).logo,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 480,
                child: TextFormField(
                  onChanged: (value) {
                    search_request_value = value;
                    searchget();
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Search for Requests',
                      labelStyle: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black87,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Search Result',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Expanded(child: Builder(
              builder: (context) {
                if (search_request_value == '' ||
                    search_request_value == null) {
                  return Center(child: Text('Search for a Request'));
                } else if (search_request_data.length == 0) {
                  return Center(child: Text('Request not Found'));
                } else {
                  return ListView.builder(
                      itemCount: search_request_data == null
                          ? 0
                          : search_request_data.length,
                      itemBuilder: (context, index) {
                        return search_request_data == null
                            ? LinearProgressIndicator()
                            : Card(
                                elevation: 3,
                                child: ListTile(
                                  trailing: Flexible(
                                    child: Column(
                                      children: <Widget>[
                                        Flexible(
                                          child: InkWell(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: Material(
                                                child: Icon(Icons.message),
                                              ),
                                            ),
                                            onTap: () {
                                              print('hhhh');
                                            },
                                          ),
                                        ),
                                        Container(
                                          height: 0.5,
                                          width: 30,
                                          color: Colors.black54,
                                        ),
                                        Flexible(
                                          child: InkWell(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Material(
                                                child: Icon(Icons.email),
                                              ),
                                            ),
                                            onTap: () {
                                              print('hhh');
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3.0, left: 7, right: 3, bottom: 3),
                                    child: Flexible(
                                      child: Text(
                                        search_request_data[index]['request_description'],
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3.0,
                                            left: 7,
                                            right: 3,
                                            bottom: 3),
                                        child: Text(
                                          search_request_data[index]['request_date'],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 18),
                                          softWrap: false,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3.0,
                                            left: 7,
                                            right: 3,
                                            bottom: 3),
                                        child: Text(
                                          'uniben'.toString().toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 18),
                                          softWrap: false,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      });
                }
              },
            ))
          ],
        ),
      );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
