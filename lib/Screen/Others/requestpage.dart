import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Others/search_request.dart';
import 'package:flutter_new/services/network.dart';
import 'package:provider/provider.dart';
import '../../Widget/Widgets.dart';



class RequestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RequestPageState();
  }
}

class RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        drawer: Provider.of<General>(context, listen: false).drawer(context),
        appBar:  AppBar(
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
                    Navigator.push(
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
            )
          ],
          title: Provider.of<General>(context, listen: false).logo,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Divider(),
            Provider.of<General>(context, listen: false).category(context),
            FutureBuilder(
              future: Provider.of<Network>(context, listen: false).GetRequest() ,
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data == null ? 0 : snapshot.data.length ,
                      itemBuilder: (context, index) {
                        return !snapshot.hasData
                            ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.lightGreen),
                              )
                            : Card(
                          elevation: 3,
                          child: ListTile(
                            trailing: Flexible(
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
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
                                  snapshot.data[index].request_description,
                                  style: TextStyle(color: Colors.black54, fontSize: 18),
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
                                    snapshot.data[index].request_date,
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
                                    'uniben'
                                        .toString()
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 18),
                                    softWrap: false,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }
            )
          ],
        ),
      );
  }
}
