import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Others/detailpage.dart';
import 'package:flutter_new/Screen/Others/search_detailpage_general.dart';
import 'package:provider/provider.dart';
import '../../Widget/Widgets.dart';
import 'package:flutter_new/services/network.dart';



class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  var searchvalue;
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 480,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                       searchvalue = value;
                   SearchResult(searchvalue);
                    });
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Type your desired Product!',
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
            SearchResult(searchvalue),
          ],
        ),
      );
  }
}




class SearchResult extends StatefulWidget{
  var search_value;

  SearchResult(this.search_value);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchResultState();
  }
}

class SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
              future: Provider.of<Network>(context, listen: false).Search_Product(widget.search_value),
              builder: (context, snapshot) {
                if (widget.search_value == '' || widget.search_value == null) {
                  return Expanded(child: Center(child: Text('Search for a Product')));
                } else if (snapshot.data.length == 0) {
                  return Expanded(child: Center(child: Text('Product not Found')));
                }
                  else if(!snapshot.hasData){
                    return Expanded(child: Center(child: CircularProgressIndicator())); 
                  }
              
                 else {
                  return Expanded(
                                      child: GridView.builder(
                        itemCount: snapshot.data.length == null ? 0 : snapshot.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return snapshot.connectionState == ConnectionState.waiting
                              ? Expanded(
                                child:Center(child: CircularProgressIndicator())
                              )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return DetailPage(
                                     image1: snapshot.data[index].image1,
                                     id: snapshot.data[index].id,
                                     title: snapshot.data[index].title,
                                     description: snapshot.data[index].description,
                                     image2: snapshot.data[index].image2,
                                     image: snapshot.data[index].image,
                                     university: snapshot.data[index].university,
                                     phone: snapshot.data[index].phone,
                                     email: snapshot.data[index].email,
                                     price: snapshot.data[index].price,
                                   );
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
                                  child: GridTile(
                                    header: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6),
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
                                       snapshot.data[index].image,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    footer: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(15)),
                                      child: Container(
                                        child: Column(
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
                                               snapshot.data[index].title,
                                                style: TextStyle(
                                                    color: Colors.white,
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
                                                '₦${snapshot.data[index].price}',
                                                style: TextStyle(
                                                    color: Colors.white,
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
                                                snapshot.data[index].university
                                                    .toString()
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                                softWrap: false,
                                                maxLines: 1,
                                                overflow: TextOverflow.fade,
                                              ),
                                            )
                                          ],
                                        ),
                                        decoration:
                                            BoxDecoration(color: Colors.black38),
                                      ),
                                    ),
                                  ),
                                );
                        }),
                  );
                     }
             
            });
  }
}
