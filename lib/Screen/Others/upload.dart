import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_new/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../Widget/Widgets.dart';
import "../../services/network.dart";

class Upload extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UploadState();
  }
}

class UploadState extends State<Upload> {
  final formkey = GlobalKey<FormState>();
  var groupvalue;
  var title;
  var description;
  var price;
  var school;
  var number;
  var email;

  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Provider.of<General>(context, listen: false).drawer(context),
        appBar: Provider.of<General>(context, listen: false).appbar(context),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Item title is Required';
                          } else {
                            title = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Title',
                            labelStyle: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.title,
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Item description is Required';
                          } 
                          else if(value.length <= 5) {
                            return 'description too short';
                          }
                          
                          else {
                            description = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Description',
                            labelStyle: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.description,
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Item Price is Required';
                          } else {
                            school = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Price',
                            labelStyle: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.attach_money,
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'School Name is Required';
                          } else {
                            price = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'School',
                            labelStyle: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.school,
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Phone number is Required';
                          } else {
                            number = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.call,
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email is Required';
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
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.email,
                              color: Colors.black87,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 170,
                    child: Provider.of<Utils>(context, listen: true).image == null
                        ? Center(child: Text('No Image Selected'))
                        : Image.file(
                            Provider.of<Utils>(context, listen: true).image,
                            fit: BoxFit.contain,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: () {
                          Provider.of<Utils>(context, listen: false).selectimage();
                        },
                        child: Text(
                          'Select First Image',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 170,
                    child: Provider.of<Utils>(context, listen: true).image1 == null
                        ? Center(child: Text('No Image Selected'))
                        : Image.file(
                            Provider.of<Utils>(context, listen: true).image1,
                            fit: BoxFit.contain,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: () {
                          return Provider.of<Utils>(context, listen: false).selectimage1();
                        },
                        child: Text(
                          'Select Second Image',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 170,
                    child: Provider.of<Utils>(context, listen: true).image2 == null
                        ? Center(child: Text('No Image Selected'))
                        : Image.file(Provider.of<Utils>(context, listen: true).image2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: () {
                          return Provider.of<Utils>(context, listen: false).selectimage2();
                        },
                        child: Text(
                          'Select Third Image',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  ExpansionTile(
                    title: Text(
                      'Select Product Category',
                      style: TextStyle(color: Colors.lightGreen),
                    ),
                    children: <Widget>[
                      RadioListTile(
                        activeColor: Colors.lightGreen,
                        value: 1,
                        groupValue: groupvalue,
                        onChanged: (e) {
                          category(e);
                        },
                        title: Text('Fashion'),
                      ),
                      RadioListTile(
                        activeColor: Colors.lightGreen,
                        onChanged: (e) {
                          category(e);
                        },
                        value: 2,
                        groupValue: groupvalue,
                        title: Text('Vehicles'),
                      ),
                      RadioListTile(
                        activeColor: Colors.lightGreen,
                        onChanged: (e) {
                          category(e);
                        },
                        value: 3,
                        groupValue: groupvalue,
                        title: Text('Kids'),
                      ),
                      RadioListTile(
                        activeColor: Colors.lightGreen,
                        onChanged: (e) {
                          category(e);
                        },
                        value: 4,
                        groupValue: groupvalue,
                        title: Text('Health and Beauty'),
                      ),
                      RadioListTile(
                        activeColor: Colors.lightGreen,
                        onChanged: (e) {
                          category(e);
                        },
                        value: 5,
                        groupValue: groupvalue,
                        title: Text('Food and Pasteries'),
                      ),
                      RadioListTile(
                        activeColor: Colors.lightGreen,
                        onChanged: (e) {
                          category(e);
                        },
                        value: 6,
                        groupValue: groupvalue,
                        title: Text('Sport and Outdoors'),
                      ),
                      RadioListTile(
                        activeColor: Colors.lightGreen,
                        onChanged: (e) {
                          category(e);
                        },
                        value: 7,
                        groupValue: groupvalue,
                        title: Text('Home and Furniture'),
                      ),
                      RadioListTile(
                        activeColor: Colors.lightGreen,
                        onChanged: (e) {
                          category(e);
                        },
                        value: 8,
                        groupValue: groupvalue,
                        title: Text('Animals and Pets'),
                      ),
                      RadioListTile(
                        activeColor: Colors.lightGreen,
                        onChanged: (e) {
                          category(e);
                        },
                        value: 9,
                        groupValue: groupvalue,
                        title: Text('Services'),
                      ),
                      RadioListTile(
                        activeColor: Colors.lightGreen,
                        onChanged: (e) {
                          category(e);
                        },
                        value: 10,
                        groupValue: groupvalue,
                        title: Text('Mobile and Tablet'),
                      ),
                      RadioListTile(
                        activeColor: Colors.lightGreen,
                        onChanged: (e) {
                          category(e);
                        },
                        value: 11,
                        groupValue: groupvalue,
                        title: Text('Electronic'),
                      ),
                      RadioListTile(
                        activeColor: Colors.lightGreen,
                        onChanged: (e) {
                          category(e);
                        },
                        value: 12,
                        groupValue: groupvalue,
                        title: Text('Acedemic'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: 50,
                      width: 150,
                      child: RaisedButton(
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                             Provider.of<Network>(context, listen: false).UploadProduct(context, Provider.of<Utils>(context, listen: false).image, Provider.of<Utils>(context, listen: false).image1, Provider.of<Utils>(context, listen: false).image2, title, price, description, school, number, groupvalue);
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }

  void category(e) {
    if (e == 1) {
      setState(() {
        groupvalue = 1;
      });
    } else if (e == 2) {
      setState(() {
        groupvalue = 2;
      });
    } else if (e == 3) {
      setState(() {
        groupvalue = 3;
      });
    } else if (e == 4) {
      setState(() {
        groupvalue = 4;
      });
    } else if (e == 5) {
      setState(() {
        groupvalue = 5;
      });
    } else if (e == 6) {
      setState(() {
        groupvalue = 6;
      });
    } else if (e == 7) {
      setState(() {
        groupvalue = 7;
      });
    } else if (e == 8) {
      setState(() {
        groupvalue = 8;
      });
    } else if (e == 9) {
      setState(() {
        groupvalue = 9;
      });
    } else if (e == 10) {
      setState(() {
        groupvalue = 10;
      });
    } else if (e == 11) {
      setState(() {
        groupvalue = 11;
      });
    } else if (e == 12) {
      setState(() {
        groupvalue = 12;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
