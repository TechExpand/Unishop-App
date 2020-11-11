import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Others/home.dart';
import 'package:flutter_new/Screen/Others/profile.dart';
import 'package:flutter_new/Widget/Widgets.dart';
import 'package:flutter_new/services/network.dart';
import 'package:flutter_new/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'Screen/Login_SignUp/Login.dart';


void main() {
  runApp(
    (
      MultiProvider(
    providers: [
      ChangeNotifierProvider<Utils>(
        create: (context) => Utils(),
      ),
      ChangeNotifierProvider<Network>(
        create: (context) => Network(),
      ),
       ChangeNotifierProvider<General>(
        create: (context) => General(),
      ),
    ],
    child: MyApp(),
  ))
  );
}




class MyApp extends StatelessWidget { 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNISHOP',
     theme: ThemeData(
       visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.lightGreen,
      ),
      home: Profile(),
    );
  }
}
