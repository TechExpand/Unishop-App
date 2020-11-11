import 'package:flutter/material.dart';
import 'package:flutter_new/services/network.dart';
import 'package:flutter_new/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../../Widget/Widgets.dart';
import 'package:carousel_pro/carousel_pro.dart';




class DetailPage extends StatefulWidget {
 var image;
 var image1;
 var image2;
 var university;
 var id;
 var title;
 var phone;
 var email;
 var price;
 var description;
  DetailPage({this.image, this.image1,this.email, this.phone, this.image2, this.university, this. title, this.id, this.description, this.price});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailPageState();
  }
}

class DetailPageState extends State<DetailPage> {
  static var pageIndex;
  static var data;
  var review_content;
  var review_value;
  double total_review = 0.0;

  List tooData = data;
  final reviewkey = GlobalKey<FormState>();
  var recommendData;
  GlobalKey<ScaffoldState> scaffold_key = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffold_key,
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
                              Image.network(
                                  widget.image.toString()),
                              Image.network(
                                   widget.image1.toString()),
                              Image.network(
                                   widget.image2.toString())
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
//                        width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(9),
                                child: SmoothStarRating(
                                  allowHalfRating: false,
                                  isReadOnly: true,
                                  rating: 1,
                                  size: 20,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                            /*Text(
                              (column.length.toString()),
                              style: TextStyle(color: Colors.black),
                            )*/
                          ],
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
                                    icon: Icon(Icons.message,
                                        color: Colors.white),
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
                            "${widget.title.toString()}${widget.id.toString()}",
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
                            '₦${widget.price.toString()}',
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
                             widget.university.toUpperCase(),
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
                             widget.description.toString(),
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Recommeded for You',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 250,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 3,
                              crossAxisSpacing: 3,
                              crossAxisCount: 1,
                            ),
                            itemCount: recommendData == null
                                ? 0
                                : recommendData["title"].length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          pageIndex = index;
                                          return DetailPage();
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
                                        recommendData['image'][index],
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
                                                recommendData['title'][index]
                                                    .toString(),
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
                                                '₦${recommendData['price'][index].toString()}',
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
                                                recommendData['university']
                                                        [index]
                                                    .toString()
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                                softWrap: false,
                                                maxLines: 1,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.black38),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Reviews:',
                              style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold)),
                        ),
                       /* Container(
                          child: Column(
                            children: column.isEmpty
                                ? <Widget>[
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('No Reviews yet'),
                                        ))
                                  ]
                                : column,
                          ),
                        ),*/
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
                              padding:
                                  const EdgeInsets.only(bottom: 20, top: 15),
                              child: Column(
                                children: <Widget>[
                                  SmoothStarRating(
                                    allowHalfRating: false,
                                    size: 40,
                                    onRated: (value) {
                                review_value = value;
                                    },
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
                        review_content = value;
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelText: 'Write Your Review',
                                    labelStyle: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                    icon: Icon(
                                      Icons.rate_review,
                                      color: Colors.black87,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(
                                  color: Colors.black,
                                  onPressed: () {
                                    if (reviewkey.currentState.validate()) {
                                      Provider.of<Network>(context, listen: false).UploadReview(scaffold_key:scaffold_key,context:context);
                                     Provider.of<Utils>(context, listen: false).circular(context);
                      
                                    }
                                  },
                                  icon: Icon(Icons.rate_review,
                                      color: Colors.white),
                                  label: Text(
                                    'Submit Review',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )
                          ],
                        ),
                        Divider(),
                        Provider.of<General>(context, listen: false).category(context),
                      ],
                    ),
                  ),
                ));
  }
}
