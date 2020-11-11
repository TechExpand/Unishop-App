import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Edit/chnageprofilepic.dart';
import 'package:flutter_new/Screen/Edit/editprofile.dart';
import 'package:flutter_new/Screen/Others/search_general.dart';
import 'package:flutter_new/Screen/Others/userproduct.dart';
import 'package:flutter_new/Screen/Others/userrequest.dart';
import 'package:flutter_new/services/network.dart';
import 'package:provider/provider.dart';
import '../../Widget/Widgets.dart';


class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            future: Provider.of<Network>(context, listen: false).GetProfile(),
          builder: (context, snapshot){
      return  !snapshot.hasData?Center(
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
                                   Column(
                                     children: <Widget>[
                                       CircleAvatar(
                                         backgroundColor: Colors.white,
                                         backgroundImage: NetworkImage(
                                             snapshot.data.pic),
                                         radius: 35,
                                         child: Text(''),
                                       ),
                                       InkWell(
                                         onTap: (){
                                           return Navigator.push(
                                             context,
                                             PageRouteBuilder(
                                               pageBuilder: (context, animation,
                                                   secondaryAnimation) {
                                                 return EditProfilePic(snapshot.data.username);
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
                                         child: Padding(
                                           padding: const EdgeInsets.all(5.0),
                                           child: Container(
                                             child:Center(child: Text('change profile picture', style:TextStyle(color:Colors.white))),
                                             width: 150,
                                             decoration: BoxDecoration(
                                               border: Border.all(color: Colors.white),
                                               borderRadius: BorderRadius.all(Radius.circular(5)),

                                             ),
                                           ),
                                         ),
                                       )
                                     ],
                                   ),
                                    Flexible(
                                      child: Column(
                                        children: <Widget>[
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                snapshot.data.username,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                snapshot.data.businessname.toUpperCase(),
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
                        delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              elevation: 3,
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('First Name :',
                                        style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        '${snapshot.data.first_name.toString()}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Last Name:',
                                        style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${snapshot.data.last_name.toString()}',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Email :',style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${snapshot.data.email.toString()}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Business Bio :',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${snapshot.data.bio.toString()}',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                            Divider(),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             child: Card(
                               elevation: 2,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: <Widget>[
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Align(
                                       alignment: Alignment.center,
                                       child: ListTile(
                                         onTap: () {
                                           return Navigator.push(
                                             context,
                                             PageRouteBuilder(
                                               pageBuilder: (context, animation,
                                                   secondaryAnimation) {
                                                 return UserProduct(
                                                     snapshot.data.pic.toString());
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

                                         title: Text('Products/Deals',
                                             style: TextStyle(color: Colors.black)),
                                         subtitle: Text('View Your Products/Deals Posted',
                                             style: TextStyle(color: Colors.black54)),
                                         trailing: Icon(Icons.add_shopping_cart),
                                       ),
                                     ),
                                   ),
                                  Container(
                                     color: Colors.black12,
                                     width: MediaQuery.of(context).size.width,
                                     height: 1,
                                     child: Text(''),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Align(
                                       alignment: Alignment.center,
                                       child: ListTile(
                                         onTap: () {
                                           return Navigator.push(
                                             context,
                                             PageRouteBuilder(
                                               pageBuilder: (context, animation,
                                                   secondaryAnimation) {
                                                 return UserRequest(
                                                     snapshot.data.pic.toString());
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
                                         title: Text('Requests',
                                             style: TextStyle(color: Colors.black)),
                                         subtitle: Text('View Your Requests Posted',
                                             style: TextStyle(color: Colors.black54)),
                                         trailing: Icon(Icons.markunread),
                                       ),
                                     ),
                                   ),
                                   Divider(),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Align(
                                       alignment: Alignment.center,
                                       child: ListTile(
                                         onTap: () {
                                           return Navigator.push(
                                             context,
                                             PageRouteBuilder(
                                               pageBuilder: (context, animation,
                                                   secondaryAnimation) {
                                                 return EditProfile(snapshot.data);
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
                                         title: Text('Edit Profile',
                                             style: TextStyle(color: Colors.black)),
                                         subtitle: Text('Edit Your Profile Details',
                                             style: TextStyle(color: Colors.black54)),
                                         trailing: Icon(Icons.perm_contact_calendar),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           )
                          ],
                        ),
                      )
                    ]))
                  ],
                );
          },
          )
          
          
          
          );
  }

}
