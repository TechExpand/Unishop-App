import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_new/Widget/Widgets.dart';
import 'package:flutter_new/services/network.dart';
import 'package:flutter_new/utils/utils.dart';
import 'package:provider/provider.dart';


class EditProduct extends StatefulWidget {
   var title;
  var description;
  var price;
  var id;
  var school;
  var number;
  var email;
    var groupvalue;

  EditProduct({
   this.title,
    this.description,
     this.price,
      this.school,
      this.number,
      this.id,
      this.groupvalue,
      this.email,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditProductState();
  }
}

class EditProductState extends State<EditProduct> {
  final formkey = GlobalKey<FormState>();
  var groupvalue;
  var title;
  var description;
  var price;
  var school;
  var number;
  var university;
  var phone;
  var email;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Fill all Fields, Images, and category to update all',
                        style: TextStyle(fontStyle: FontStyle.italic)),
                  ),
                  Divider(),
                  Text('Change Product Details'),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        initialValue: widget.title,
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
                        initialValue:widget.description,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Item description is Required';
                          } else {
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
                        initialValue: widget.price,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Item Price is Required';
                          } else {
                            price = value;
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
                        initialValue: widget.school,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'School Name is Required';
                          } else {
                            school = value;
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
                        initialValue: widget.number,
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
                        initialValue: widget.email,
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
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: 30,
                      width: 170,
                      child: RaisedButton(
                        color: Colors.lightGreen,
                        onPressed: (){
                          if (formkey.currentState.validate()) {
                              Provider.of<Utils>(context, listen: false).circular(context);
                            Provider.of<Network>(context, listen: false).UpdateDetails(
                            id: widget.id,
                            title:title,
                            price:price,
                            description:description,
                            school: school,
                            number:number,
                            groupvalue:widget.groupvalue,
                            context:context,
                            );
                          }
                        },
                        child: Text(
                          'update details only',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Text('Change Product Images'),
                  Divider(),
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
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: 30,
                      width: 200,
                      child: RaisedButton(
                        color: Colors.lightGreen,
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                            Provider.of<Utils>(context, listen: false).circular(context);
                            Provider.of<Network>(context, listen: false).UploadImage1(
                              context:context,
                              image:Provider.of<Utils>(context, listen: false).image,
                              id: widget.id,
                               groupvalue:widget.groupvalue
                              );
                            
                          }
                        },
                        child: Text(
                          'update first image only',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 170,
                    child: Provider.of<Utils>(context, listen: false).image1 == null
                        ? Center(child: Text('No Image Selected'))
                        : Image.file(
                            Provider.of<Utils>(context, listen: false).image1,
                            fit: BoxFit.contain,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: () {
                          Provider.of<Utils>(context, listen: false).selectimage1();
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
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: 30,
                      width: 230,
                      child: RaisedButton(
                        color: Colors.lightGreen,
                       onPressed: () {
                          if (formkey.currentState.validate()) {
                            Provider.of<Utils>(context, listen: false).circular(context);
                            Provider.of<Network>(context, listen: false).UploadImage2(
                              context:context,
                              image:Provider.of<Utils>(context, listen: false).image1,
                              id: widget.id,
                               groupvalue:widget.groupvalue
                              );
                            
                          }
                        },
                        child: Text(
                          'update second image only',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 170,
                    child: Provider.of<Utils>(context, listen: false).image2 == null
                        ? Center(child: Text('No Image Selected'))
                        : Image.file(Provider.of<Utils>(context, listen: false).image2),
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
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: 30,
                      width: 210,
                      child: RaisedButton(
                        color: Colors.lightGreen,
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                            Provider.of<Utils>(context, listen: false).circular(context);
                            Provider.of<Network>(context, listen: false).UploadImage3(
                              context:context,
                              image:Provider.of<Utils>(context, listen: false).image2,
                              id: widget.id,
                               groupvalue:widget.groupvalue
                              );
                            
                          }
                        },
                        child: Text(
                          'update third image only',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Text('Change Product Category'),
                  Divider(),
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
                      height: 30,
                      width: 190,
                      child: RaisedButton(
                        color: Colors.lightGreen,
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                            Provider.of<Utils>(context, listen: false).circular(context);
                            Provider.of<Network>(context, listen: false).UpdateCategory(
                              id: widget.id,
                              context:context, 
                              groupvalue: groupvalue
                              );
                          }
                        },
                        child: Text(
                          'update category only',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Fill all Fields, Images, and category to update all',
                        style: TextStyle(fontStyle: FontStyle.italic)),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Container(
                      height: 30,
                      width: 150,
                      child: RaisedButton(
                        color: Colors.lightGreen,
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                            Provider.of<Network>(context, listen: false).UpdateDetailsAndImage(title:title, price:price, description:description, school:school, number:number, groupvalue:groupvalue, context:context, image:Provider.of<Utils>(context, listen: false).image, image1:Provider.of<Utils>(context, listen: false).image1, image2:Provider.of<Utils>(context, listen: false).image2);
                            Provider.of<Utils>(context, listen: false).circular(context);
                           
                          }
                        },
                        child: Text(
                          'update all',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
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

 
}
