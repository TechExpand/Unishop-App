import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Login_SignUp/SignUp.dart';
import 'package:flutter_new/Widget/Widgets.dart';
import 'package:flutter_new/utils/utils.dart';
import 'package:flutter_new/services/network.dart';
import 'package:provider/provider.dart';


class Login extends StatelessWidget {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final form_key = GlobalKey<FormState>();
  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: SweepGradient(startAngle: 0.7, colors: [
                  Colors.greenAccent,
                  Colors.lightGreen,
                  Colors.greenAccent
                ]),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.width / 13,
                left: MediaQuery.of(context).size.width / 25,
                child: InkWell(
                   onTap: () {
                          Navigator.pop(context);
                        },
                                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                         
                    ),
                  ),
                )),
            Container(
              child: Column(
                children: <Widget>[
                  Divider(),
                  Provider.of<General>(context, listen: false).logo,
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text('Welcome Back',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 4.2),
            ),
            Container(
              child: Form(
                key: form_key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 450,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email Required';
                          } else {
                            email = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: SizedBox(
                        width: 450,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password Required';
                            } else {
                              password = value;
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.5),
            ),
             Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3.2),
              child: InkWell(
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
                child: Text("Don't Have an Account? Sign Up",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.2),
              child: InkWell(
                onTap: () {
                  if (form_key.currentState.validate()) {
                   Provider.of<Network>(context, listen: false).login(email:email, password:password, context:context);
                    Provider.of<Utils>(context, listen: false).circular(context);
                  }
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    width: 100,
                    height: 40,
                    child: Center(
                        child: Text('Submit',
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)))),
              ),
            )
          ],
        ),
      );
  }
}
