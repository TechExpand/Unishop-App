import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Edit/editrequest.dart';
import 'package:flutter_new/Screen/Others/search_general.dart';
import 'package:provider/provider.dart';
import '../../Widget/Widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class UserRequest extends StatefulWidget {
  var profile_pic;

  UserRequest(this.profile_pic);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserRequestState();
  }
}

class UserRequestState extends State<UserRequest> {
  var deleterequestcheck;
  var deleteuserrequestdata;
  List userrequestdata;
  var userrequestindex;
  var i;
  var x;

  Future getuserrequest() async {
    var res = await http.get(
        Uri.encodeFull('http://192.168.43.231:8000/shop/userrequestapi/'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Token ab3802e3a5657660e52eeff04cd3ad1f4775efba"
        });
    this.setState(() {
      userrequestdata = json.decode(res.body);
    });

    for (i in userrequestdata) {
      x = i['id'];
      print(x);
    }

    return userrequestdata;
  }

  circular() {
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

  renewuserrequest() {
    var profile_data;
    if (deleterequestcheck.statusCode == 200 ||
        deleterequestcheck.statusCode == 204) {
      return Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return UserRequest(profile_data['pic'].toString());
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getuserrequest();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
            drawer: Provider.of<General>(context, listen: false).drawer(context),
            appBar: AppBar(
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(
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
                    ),
                  ),

              ],
              title: Provider.of<General>(context, listen: false).logo,
            ),
            body: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                flexibleSpace: Flexible(
                  child: Stack(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 40,
                                left: MediaQuery.of(context).size.width / 1.25),
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Text(''),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white10),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 1.5,
                                top: 60),
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Text(''),
                              decoration: BoxDecoration(color: Colors.white10),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 3,
                                top: MediaQuery.of(context).size.width / 10),
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Text(''),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.white10),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 15),
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Text(''),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.white10),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 2),
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Text(''),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white10),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 8,
                                top: MediaQuery.of(context).size.width / 15),
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Text(''),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white10),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(widget.profile_pic),
                                radius: 35,
                                child: Text(''),
                              ),
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                          'My Request',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                leading: Text(''),
                expandedHeight: 100,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (context, index) {
                    Future deleteuserrequest() async {
                      try {
                        deleterequestcheck = await http.delete(
                            Uri.encodeFull('http://192.168.43.231:8000/shop/requestapi/${userrequestdata[index]['id'].toString()}/'),
                            headers: {
                              "Accept": "application/json",
                              "Authorization": "Token ab3802e3a5657660e52eeff04cd3ad1f4775efba"
                            });
                        this.setState(() {
                          deleteuserrequestdata = json.decode(deleterequestcheck.body);
                        });
                        return deleteuserrequestdata;
                      } catch (e) {
                        return print(e);
                      }
                    }


                    Delete() {
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
                              child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Are you sure you want to delete?',
                                        style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RaisedButton(
                                          color: Colors.lightGreen,
                                          onPressed: () {
                                            deleteuserrequest();
                                            circular();
                                            Future.delayed(
                                                Duration(seconds: 4), renewuserrequest);
                                          },
                                          child: Text(
                                            'Yes, i want to Delete',
                                            style: TextStyle(
                                                color: Colors.white, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      );
                    }
                return Card(
                    elevation: 3,
                    child: ListTile(
                        trailing: Flexible(
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                child: InkWell(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
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
                                    padding: const EdgeInsets.only(top: 10.0),
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
                              userrequestdata[index]['request_description'],
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 3.0, left: 7, right: 3, bottom: 3),
                              child: Text(
                                userrequestdata[index]['request_date'],
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 18),
                                softWrap: false,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 3.0, left: 7, right: 3, bottom: 3),
                              child: Text(
                                'uniben'.toString().toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 18),
                                softWrap: false,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        return Navigator.pushReplacement(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return EditRequest(index,userrequestdata);
                                            },
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child: child,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.lightGreen,
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 0.5,
                                      color: Colors.black54,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Delete();
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        )));
              },
                      childCount:
                          userrequestdata == null ? 0 : userrequestdata.length))
            ]));
  }
}
