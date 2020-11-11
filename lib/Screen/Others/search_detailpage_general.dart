import 'package:flutter_new/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widget/Widgets.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SearchDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchDetailPageState();
  }
}

class SearchDetailPageState extends State<SearchDetailPage> {
  static var searchpageIndex;
  static var searchdata;
  int searchPage_Index = searchpageIndex;
  List search_Data = searchdata;
  final reviewkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          drawer: Provider.of<General>(context, listen: false).drawer(context),
          appBar: Provider.of<General>(context, listen: false).appbar(context),
          body: Form(
              key: reviewkey,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 320,
                        child: Carousel(
                          autoplay: false,
                          // showIndicator: false,
                          images: [
                            Image.network(search_Data[searchPage_Index]['image']
                                .toString()),
                            Image.network(search_Data[searchPage_Index]
                                    ['image1']
                                .toString()),
                            Image.network(search_Data[searchPage_Index]
                                    ['image2']
                                .toString())
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                          child: SmoothStarRating(
                            allowHalfRating: false,
                            isReadOnly: true,
                            rating: 4,
                            size: 20,
                            onRated: (value) {},
                            color: Colors.lightGreen,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Colors.lightGreen,
                          Colors.black87,
                          Colors.lightGreen
                        ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {}),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: IconButton(
                                  icon: Icon(Icons.call, color: Colors.white),
                                  onPressed: () {
                                    return null;
                                  }),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: IconButton(
                                  icon:
                                      Icon(Icons.message, color: Colors.white),
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Title:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          search_Data[searchPage_Index]['title'],
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Price:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '₦${search_Data[searchPage_Index]['price']}',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'School:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          search_Data[searchPage_Index]['university']
                              .toUpperCase(),
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Description:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          search_Data[searchPage_Index]['description'],
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      ExpansionTile(
                        subtitle: Text(
                          'whats your thought on this item',
                          style: TextStyle(color: Colors.lightGreen),
                        ),
                        title: Text(
                          "Tap to Review Product",
                          style: TextStyle(color: Colors.lightGreen),
                        ),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 15),
                            child: Column(
                              children: <Widget>[
                                SmoothStarRating(
                                  allowHalfRating: false,
//            isReadOnly: true,
                                  rating: 4,
                                  size: 40,
                                  onRated: (value) {},
                                  color: Colors.lightGreen,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Rate this product',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Write a Review';
                                } else {
//                    review = value;
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  labelText: 'Write Your Review',
                                  labelStyle: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                  icon: Icon(
                                    Icons.rate_review,
                                    color: Colors.black87,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton.icon(
                                color: Colors.black,
                                onPressed: () {
                                  if (reviewkey.currentState.validate()) {
//                            Future.delayed(Duration(seconds: 5),   navigate);
                                  }
                                },
                                icon: Icon(Icons.rate_review,
                                    color: Colors.white),
                                label: Text(
                                  'Submit Review',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                      Divider(),
                      Provider.of<General>(context, listen: false).category(context),
                    ]),
              )),
        );
  }
}
