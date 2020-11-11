import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Login_SignUp/SignUp.dart';
import 'package:flutter_new/Screen/Others/home.dart';
import 'package:flutter_new/Screen/Others/inquiry.dart';
import 'package:flutter_new/Screen/Others/profile.dart';
import 'package:flutter_new/Screen/Others/requestpage.dart';
import 'package:flutter_new/Screen/Others/search_general.dart';
import 'package:flutter_new/screen/SubCategorypage/fashionsubcategory.dart';
import 'package:flutter_new/screen/SubCategorypage/vehiclesubcategory.dart';




class General with ChangeNotifier{
  //Uinshop Logo
Widget logo =
    Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
  Text(
    'UNI',
    style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
  ),
  Icon(
    Icons.shopping_cart,
    color: Colors.black,
  ),
  Text('SHOP',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30)),
]);


//reusable form
  Widget textfield([icon, text, error, textname]) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: 480,
        child: TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return error;
            } else {
              textname = value;
              return null;
            }
          },
          decoration: InputDecoration(
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: text,
              labelStyle:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
              icon: Icon(
                icon,
                color: Colors.black87,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ),
    );
  }

  Widget appbar(context) {
    return AppBar(
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
      title: logo,
    );
  }

  Widget category(context){
    return Container(
    height: 110,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return   FashionSubCategory();
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
            child: Tab(
              child: Text('Fashion'),
              icon: Container(
                width: 100,
                height: 60,
                child: Image.asset(
                  'images/fashion.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
           return  Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return   VehicleSubCategory();
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tab(
              child: Text('Vehicles'),
              icon: Container(
                width: 100,
                height: 60,
                child: Image.asset(
                  'images/car.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
//        Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Tab(
//            child: Text('Kids'),
//            icon: Container(
//              width: 100,
//              height: 60,
//              child: Image.asset(
//                'images/kid.png',
//                fit: BoxFit.fitHeight,
//              ),
//            ),
//          ),
//        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tab(
            child: Text('Health and Beauty'),
            icon: Container(
              width: 100,
              height: 60,
              child: Image.asset(
                'images/beauty.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tab(
            child: Text('Food and Pasteries'),
            icon: Container(
              width: 100,
              height: 60,
              child: Image.asset(
                'images/food.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tab(
            child: Text('Sport and Outdoors'),
            icon: Container(
              width: 100,
              height: 60,
              child: Image.asset(
                'images/sport.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tab(
            child: Text('Hostel and Furniure'),
            icon: Container(
              width: 100,
              height: 60,
              child: Image.asset(
                'images/furniture.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tab(
            child: Text('Animals and Pets'),
            icon: Container(
              width: 100,
              height: 60,
              child: Image.asset(
                'images/pet.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tab(
            child: Text('Services'),
            icon: Container(
              width: 100,
              height: 60,
              child: Image.asset(
                'images/service.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tab(
            child: Text('Mobile and Tablet'),
            icon: Container(
              width: 100,
              height: 60,
              child: Image.asset(
                'images/phone.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tab(
            child: Text('Electronic'),
            icon: Container(
              width: 100,
              height: 60,
              child: Image.asset(
                'images/tv.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tab(
            child: Text('Acedemic'),
            icon: Container(
              width: 100,
              height: 60,
              child: Image.asset(
                'images/acedemic.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ],
    ),
  );}

  Widget drawer(context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
        child: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                ),
                child: logo,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return MyHomePage();
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
                title: Text('Home'),
                leading: Icon(Icons.home),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return PostDeal();
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
                title: Text('Post New Deal/Product'),
                leading: Icon(Icons.cloud_upload),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return RequestPage();
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
                title: Text('Customer Request'),
                leading: Icon(Icons.account_circle),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Profile();
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
                title: Text('Profile'),
                leading: Icon(Icons.account_circle),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return InquiryPage();
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
                title: Text('Inquiries'),
                leading: Icon(Icons.announcement),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                title: Text('Close'),
                leading: Icon(Icons.close),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

General general = General();
