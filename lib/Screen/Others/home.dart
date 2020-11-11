import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Others/detailpage.dart';
import 'package:flutter_new/screen/SubCategorypage/fashionsubcategory.dart';
import 'package:flutter_new/services/network.dart';
import 'package:provider/provider.dart';
import '../../Widget/Widgets.dart';



class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Provider.of<General>(context, listen: false).drawer(context),
        appBar: Provider.of<General>(context, listen: false).appbar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Placeholder(
              fallbackWidth: MediaQuery.of(context).size.width,
              fallbackHeight: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Divider(),
            Provider.of<General>(context, listen: false).category(context),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Deals',
                style: TextStyle(fontSize: 17),
              ),
            ),
            FutureBuilder(
              future: Provider.of<Network>(context).Merchant_Api(),
              builder: (context, snapshot) {
                return snapshot.hasData?Expanded(
                  child: GridView.builder(
                      itemCount: snapshot.data==null?0:snapshot.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return  InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) {
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
                          child: GridTile(
                            header: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Align(
                                        alignment: Alignment.topRight,
                                        child: Chip(
                                          label: Text('10/02/2019',
                                              style:
                                              TextStyle(fontStyle: FontStyle.italic)),
                                        ),
                                      ),
                                ),

                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(15)),
                              child: Image.network(
                                snapshot.data[index].image,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            footer: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(15)),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3.0,left:  7, right:  3, bottom: 3),
                                      child: Text(
                                        snapshot.data[index].title,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                        softWrap: false,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3.0,left:  7, right:  3, bottom: 3),
                                      child: Text(
                                        '₦${snapshot.data[index].price}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                        softWrap: false,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 3.0,left:  7, right:  3, bottom: 3),
                                          child: Text(
                                            snapshot.data[index].university.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 18),
                                            softWrap: false,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                                decoration: BoxDecoration(color: Colors.black38),
                              ),
                            ),
                          ),
                        );
                      }),
                ):Center(
                  child:Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/5),
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
                        ) ,
                  ));
              }
            )
          ],
        ),
      );
  }
}
