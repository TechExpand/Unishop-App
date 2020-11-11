import 'package:flutter_new/services/network.dart';
import 'package:flutter_new/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Edit/editproduct.dart';
import 'package:flutter_new/Screen/Others/search_general.dart';
import 'package:provider/provider.dart';
import '../../Widget/Widgets.dart';


class UserProduct extends StatefulWidget {
  var profile_pic;

  UserProduct(this.profile_pic);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserProductState();
  }
}

class UserProductState extends State<UserProduct> {




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
                child:IconButton(
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

            ],
            title: Provider.of<General>(context, listen: false).logo,
          ),
          body: FutureBuilder(
            future:  Provider.of<Network>(context, listen: false).GetUserProducts(),
            builder: (context, snapshot){
           return   !snapshot.hasData?Center(
                  child: CircularProgressIndicator(),
                ):CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      flexibleSpace: Flexible(
                        child: Stack(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 40,
                                      left: MediaQuery.of(context).size.width /
                                          1.25),
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
                                      left: MediaQuery.of(context).size.width /
                                          1.5,
                                      top: 60),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    child: Text(''),
                                    decoration:
                                        BoxDecoration(color: Colors.white10),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left:
                                          MediaQuery.of(context).size.width / 3,
                                      top: MediaQuery.of(context).size.width /
                                         10),
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
                                      left: MediaQuery.of(context).size.width /
                                          15),
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
                                      left: MediaQuery.of(context).size.width /
                                          2),
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
                                      left:
                                          MediaQuery.of(context).size.width / 8,
                                      top: MediaQuery.of(context).size.width /
                                          15),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    CircleAvatar(
                                      
                                      backgroundColor: Colors.white,
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
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Text(
                                                'My Products/Deals',
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
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 2.5,
                        crossAxisSpacing: 3,
                        crossAxisCount: 2,
                      ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridTile(
                              header: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Chip(
                                    label: Text('10/02/2019',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic)),
                                  ),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(15)),
                                child: Image.network(
                                 snapshot.data[index].image.toString(),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              footer: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(15)),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3.0,
                                            left: 7,
                                            right: 3,
                                            bottom: 3),
                                        child: Text(
                                          snapshot.data[index].title
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 18),
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
                                         snapshot.data[index].price
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 18),
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
                                         snapshot.data[index].university
                                              .toString()
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 18),
                                          softWrap: false,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3.0, left: 7, bottom: 3),
                                                child: Container(
                                                  width: 60,
                                                  height: 30,
                                                  child: RaisedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        PageRouteBuilder(
                                                          pageBuilder: (context,
                                                              animation,
                                                              secondaryAnimation) {
                                                            return EditProduct(
                                                            id: snapshot.data[index].id,
                                                             title:  snapshot.data[index].title,
                                                             school: snapshot.data[index].university,
                                                            number:   snapshot.data[index].phone,
                                                            price:  snapshot.data[index].price,
                                                            description:  snapshot.data[index].description,
                                                            email:  snapshot.data[index].email,
                                                            groupvalue: snapshot.data[index].category[0],
                                                            );
                                                          },
                                                          transitionsBuilder:
                                                              (context,
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
                                                    color: Colors.lightGreen,
                                                    child: Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3.0, left: 7, bottom: 3),
                                                child: Container(
                                                  width: 60,
                                                  height: 30,
                                                  child: RaisedButton(
                                                    onPressed: () {
                                                      return Delete(snapshot.data[index].id);
                                                    },
                                                    color: Colors.red,
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      )
                                    ],
                                  ),
                                  decoration:
                                      BoxDecoration(color: Colors.black38),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                          childCount: snapshot.data == null
                              ? 0
                              : snapshot.data.length),
                    )
                  ],
          );
            })
          );}

                  Delete(id) {
                          return showDialog(
                            context: context,
                            child: Dialog(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                height: 70,
                                child: Center(
                                  child: SingleChildScrollView(
                                      child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Are you sure you want to delete?',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RaisedButton(
                                          color: Colors.lightGreen,
                                          onPressed: () {
                                            Provider.of<Network>(context, listen: false).deleteuserproduct(context, id);
                                            Provider.of<Utils>(context, listen: false).circular(context);
                                          
                                          },
                                          child: Text(
                                            'Yes, i want to Delete',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                                ),
                              ),
                            ),
                          );
                        }}