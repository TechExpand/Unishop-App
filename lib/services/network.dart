import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/Screen/Others/home.dart';
import 'package:flutter_new/Screen/Others/profile.dart';
import 'package:flutter_new/Screen/Others/upload.dart';
import 'package:flutter_new/Screen/Others/userproduct.dart';
import 'package:flutter_new/Screen/Others/userrequest.dart';
import 'package:flutter_new/model/Products.dart';
import 'package:flutter_new/model/Profile.dart';
import 'package:flutter_new/model/Request.dart';
import 'package:flutter_new/screen/login_signup/Login.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Network with ChangeNotifier{
var token;
double average_review;
    var total_review = 0.0;
    var review;
    var review_data;
    var profile_objects;
     List<Widget> column = [];


  Future Merchant_Api() async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://192.168.43.231:8000/shop/merchantapi/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token ab3802e3a5657660e52eeff04cd3ad1f4775efba"
          });
      if (res.statusCode == 200) {
        print(res.body);
        var body = jsonDecode(res.body) as List;
        List<Products> product_objects = body
            .map((product_objects_json) =>
                Products.fromJson(product_objects_json))
            .toList();
        return product_objects;
      } else {
        throw 'Cant get products';
      }
    } catch (e) {
      print('Cant get products');
      print(e);
    }
  }




 Future Search_Product(searchvalue) async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://192.168.43.231:8000/shop/merchantapi/?search=${searchvalue}'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token ab3802e3a5657660e52eeff04cd3ad1f4775efba"
          });
      if (res.statusCode == 200) {
        print(res.body);
        var body = jsonDecode(res.body) as List;
        List<Products> product_objects = body
            .map((product_objects_json) =>
                Products.fromJson(product_objects_json))
            .toList();
        return product_objects;
      } else {
        throw 'Cant get products';
      }
    } catch (e) {
      print('Cant get products');
      print(e);
    }
  }



  Future login({email, password , context}) async {
    try{
         var upload = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.43.231:8000/shop/token/login/'));
    upload.fields['email'] = email.toString();
    upload.fields['password'] = password.toString();
    final stream = await upload.send();
    var response = await http.Response.fromStream(stream);
     token = json.decode(response.body);
      if (response.statusCode == 200) {
        Navigator.pop(context);
        return Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return Upload();
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
      } else {
        Navigator.pop(context);
        return showDialog(
          context: context,
          child: Dialog(
            backgroundColor: Colors.black12,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 70,
              child: Center(
                child: Text(
                  'Unable to log in with provided credentials.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
    }
    }catch(e){
      print(e);
       print(e);
    }

  }

Future UploadProduct(context, image, image1, image2, title, price, description, school, number, groupvalue) async {
   try{
    var upload = http.MultipartRequest('POST',
        Uri.parse('http://192.168.43.231:8000/shop/merchantapi/'));
    var file = await http.MultipartFile.fromPath('image', image.path);
    var file1 = await http.MultipartFile.fromPath('image1', image1.path);
    var file2 = await http.MultipartFile.fromPath('image2', image2.path);
    upload.files.add(file);
    upload.files.add(file1);
    upload.files.add(file2);
    upload.fields['title'] = title.toString();
    upload.fields['price'] = price.toString();
    upload.fields['description'] = description.toString();
    upload.fields['university'] = school.toString();
    upload.fields['phone'] = number.toString();
    upload.fields['email'] = 'dail@gmail.com';
    upload.fields['category'] = "${groupvalue}";
    upload.headers['Authorization'] = "Token ab3802e3a5657660e52eeff04cd3ad1f4775efba";
      final stream = await upload.send();
      final response = await http.Response.fromStream(stream);
      print(response.statusCode);
      var res = json.decode(response.body);
      print(res);
     if (response.statusCode.toString() == '200' ||
        response.statusCode.toString() == '201') {
        return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return MyHomePage();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
        }

         if (response.statusCode.toString() == '500' ||
        response.statusCode.toString() == '400') {
        return showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('There Was an  Error! Check Submited Data', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
        }

     
    } catch (e) {
      print(e);
   return  showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('Unable to Upload Product/Service', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
    }
  }



   Future signup({email,username,re_password,password, first_name, last_name, businessname, bio, context, image}) async {
     var response;
    var upload = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.43.231:8000/shop/users/'));
    var file = await http.MultipartFile.fromPath('pic', image.path);
    upload.files.add(file);
    upload.fields['email'] = email.toString();
    upload.fields['username'] = username.toString();
    upload.fields['password'] = password.toString();
    upload.fields['first_name'] = first_name.toString();
    upload.fields['last_name'] = last_name.toString();
    upload.fields['businessname'] = businessname.toString();
     upload.fields['password'] = password.toString();
    upload.fields['re_password'] = re_password.toString();
    upload.fields['bio'] = bio.toString();

    final stream = await upload.send();
    response = await http.Response.fromStream(stream);
    var body = jsonDecode(response.body);
     if (response.statusCode.toString() == '200' ||
        response.statusCode.toString() == '201') {
      Navigator.pop(context);
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return Login();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
     else if (response.statusCode == 400) {
        Navigator.pop(context);
        showDialog(
            child: AlertDialog(
              title: Center(
                child: Text('Check Credentials',
                    style: TextStyle(color: Colors.blue)),
              ),
              content: Container(
                  width: 280,
                  height: 180,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: body['username'] == null
                            ? Icon(Icons.check, color: Colors.green)
                            : Text(body['username'][0].toString(),
                                style: TextStyle(color: Colors.blue)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: body['email'] == null
                            ? Icon(Icons.check, color: Colors.green)
                            : Text(body['email'][0].toString(),
                                style: TextStyle(color: Colors.blue)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: body['password'] == null
                            ? Icon(Icons.check, color: Colors.green)
                            : Text(body['password'][0].toString(),
                                style: TextStyle(color: Colors.blue)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: body['non_field_errors'] == null
                            ? Icon(Icons.check, color: Colors.green)
                            : Text(body['non_field_errors'][0].toString(),
                                style: TextStyle(color: Colors.blue)),
                      )
                    ],
                  )),
            ),
            context: context);
      }
     else {
      Navigator.pop(context);
      return showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('Unable to Sign In', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
    }
    return print(response.body);
  }




    Future UploadFile({image, username, context}) async {
      var editpropicresponse;
    var upload = http.MultipartRequest('PUT',
        Uri.parse('http://192.168.43.231:8000/shop/users/me/'));
    var file = await http.MultipartFile.fromPath('pic', image.path);
    upload.files.add(file);
    upload.fields['username'] = username.toString();
    upload.headers['authorization'] = 'Token ab3802e3a5657660e52eeff04cd3ad1f4775efba';

    try {
      final stream = await upload.send();
      editpropicresponse = await http.Response.fromStream(stream);
      print(editpropicresponse.statusCode);
      var res = json.decode(editpropicresponse.body);
    if(editpropicresponse.statusCode == 200 || editpropicresponse.statusCode == 201){
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return Profile();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
  }
      return print(res);
    } catch (e) {
      print(e);
      return null;
    }
  }



  Future getrecommended() async {
    var recommendData;
    var res = await http.get(
        Uri.encodeFull('http://192.168.43.231:8000/shop/recommended/'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Token ab3802e3a5657660e52eeff04cd3ad1f4775efba"
        });
      recommendData = json.decode(res.body);
    return recommendData;
  }


    Future UploadReview({scaffold_key, context, review_content, review_value, id}) async {
     var response;
    var upload = http.MultipartRequest('POST',
        Uri.parse('http://192.168.43.231:8000/shop/reviewapi/'));
    upload.fields['content'] = review_content.toString();
    upload.fields['rate'] = review_value.toString();
    upload.fields['merchant'] = id;
    upload.headers['authorization'] ='Token ab3802e3a5657660e52eeff04cd3ad1f4775efba';


    try {
      final stream = await upload.send();
       response = await http.Response.fromStream(stream);
      var res = json.decode(response.body);
      if(res.statusCode == 200){
         
    if (response.statusCode == 200 ||
        response.statusCode == 201) {
      Navigator.of(context, rootNavigator: true).pop();
       scaffold_key.currentState.showSnackBar((SnackBar(content: Text('Review Posted!'),)));
    
  }
      }
      return print(res);
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future get_review({context, id}) async {
    var res = await http.get(
        Uri.encodeFull(
            "http://192.168.43.231:8000/shop/postreview/$id"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Token ab3802e3a5657660e52eeff04cd3ad1f4775efba"
        });

      review_data = json.decode(res.body);
  

    for (review in review_data) {
      column.add(Column(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(review['content']),
            )),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(review['created_date']),
            )),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: SmoothStarRating(
                allowHalfRating: false,
                isReadOnly: true,
                rating: double.parse(review['rate']),
                size: 15,
                color: Colors.lightGreen,
              ),
            ),
          ),
          Divider()
        ],
      ));

      total_review = total_review + double.parse(review['rate']);
    }
    average_review = total_review / column.length;
    return print(review_data);
  }


  Future UpdateDetails({title,price,description,school,number,groupvalue,context, id, image, image1, image2}) async {
    try {
    var editproductresponse;
    var upload = http.MultipartRequest(
        'PUT',
        Uri.parse(
            'http://192.168.43.231:8000/shop/usermerchantapi/$id/'));
    upload.fields['title'] = title.toString();
    upload.fields['price'] = price.toString();
    upload.fields['description'] = description.toString();
    upload.fields['university'] = school.toString();
    upload.fields['phone'] = number.toString();
    upload.fields['email'] = 'dail@gmail.com';
    upload.fields['category'] = "${groupvalue}";
    upload.headers['authorization'] =
        'Token ab3802e3a5657660e52eeff04cd3ad1f4775efba';
      final stream = await upload.send();
      editproductresponse = await http.Response.fromStream(stream);
      print(editproductresponse.body);
      var res = json.decode(editproductresponse.body);
       if (editproductresponse.statusCode == 200 ||
        editproductresponse.statusCode == 201) {
          Navigator.pop(context);
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return UserProduct(profile_objects.pic.toString());
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child, 
            );
          },
        ),
      );
    }else {
      Navigator.pop(context);
      return showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('Check The Submited Data!', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
    }
      
    } catch (e) {
      print(e);
      Navigator.pop(context); 
      return showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('Unable to Update Product', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
    
    }
  }




Future UpdateDetailsAndImage({
  title,
  price,
  email,
  description,
  school,
  number,
  groupvalue,
  context,
  image,
   image1,
    image2,
     id}) async {
    var editproductresponse;
    var upload = http.MultipartRequest(
        'PUT',
        Uri.parse(
            'http://192.168.43.231:8000/shop/usermerchantapi/$id/'));
    var file = await http.MultipartFile.fromPath('image', image.path);
    var file1 = await http.MultipartFile.fromPath('image1', image1.path);
    var file2 = await http.MultipartFile.fromPath('image2', image2.path);
    upload.files.add(file);
    upload.files.add(file1);
    upload.files.add(file2);
    upload.fields['title'] = title.toString();
    upload.fields['price'] = price.toString();
    upload.fields['description'] = description.toString();
    upload.fields['university'] = school.toString();
    upload.fields['phone'] = number.toString();
    upload.fields['email'] = email.toString();
    upload.fields['category'] = "${groupvalue}";
    upload.headers['authorization'] =
        'Token ab3802e3a5657660e52eeff04cd3ad1f4775efba';

    try {
      final stream = await upload.send();
      editproductresponse = await http.Response.fromStream(stream);
      print(editproductresponse.statusCode);
      var res = json.decode(editproductresponse.body);
       if (editproductresponse.statusCode == 200 ||
        editproductresponse.statusCode == 201) {
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return UserProduct(profile_objects.pic.toString());
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child, 
            );
          },
        ),
      );
    }
      return print(res);
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future UploadImage1({
   context,
   id,
   image,
   groupvalue,
   }) async {
     try {
    var editproductresponse;
    var upload = http.MultipartRequest(
        'PUT', Uri.parse(
            'http://192.168.43.231:8000/shop/usermerchantapi/$id/'));
    var file = await http.MultipartFile.fromPath('image', image.path);
    upload.files.add(file);
    upload.fields['category'] = "${groupvalue}";
    upload.headers['authorization'] =
    'Token ab3802e3a5657660e52eeff04cd3ad1f4775efba';

   
      final stream = await upload.send();
      editproductresponse = await http.Response.fromStream(stream);
      print(editproductresponse.statusCode);
      var res = json.decode(editproductresponse.body);
      if (editproductresponse.statusCode == 200 ||
        editproductresponse.statusCode == 201) {
          Navigator.pop(context);
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return UserProduct(profile_objects.pic.toString());
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }else {
      Navigator.pop(context);
      return showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('Check The Submited Data!', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
    }
      
      
    } catch (e) {
      print(e);
      Navigator.pop(context);
      return showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('Unable to Update First Image', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
    }
      
    }
  






  Future UploadImage2({
   context,
   id,
   image,
   groupvalue,
   }) async {
     try {
    var editproductresponse;
    var upload = http.MultipartRequest(
        'PUT', Uri.parse(
            'http://192.168.43.231:8000/shop/usermerchantapi/$id/'));
    var file = await http.MultipartFile.fromPath('image1', image.path);
    upload.files.add(file);
    upload.fields['category'] = "${groupvalue}";
    upload.headers['authorization'] =
    'Token ab3802e3a5657660e52eeff04cd3ad1f4775efba';
      final stream = await upload.send();
      editproductresponse = await http.Response.fromStream(stream);
      print(editproductresponse.statusCode);
      var res = json.decode(editproductresponse.body);
      if (editproductresponse.statusCode == 200 ||
        editproductresponse.statusCode == 201) {
          Navigator.pop(context);
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return UserProduct(profile_objects.pic.toString());
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }else {
      Navigator.pop(context);
      return showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('Check The Submited Data!', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
    }
      
      
    } catch (e) {
      print(e);
      Navigator.pop(context);
      return showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('Unable to Update Second Image', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
    }
      
    }
  



  Future UploadImage3({
   context,
   id,
   image,
   groupvalue,
   }) async {
     try {
    var editproductresponse;
    var upload = http.MultipartRequest(
        'PUT', Uri.parse(
            'http://192.168.43.231:8000/shop/usermerchantapi/$id/'));
    var file = await http.MultipartFile.fromPath('image2', image.path);
    upload.files.add(file);
    upload.fields['category'] = "${groupvalue}";
    upload.headers['authorization'] =
    'Token ab3802e3a5657660e52eeff04cd3ad1f4775efba';

   
      final stream = await upload.send();
      editproductresponse = await http.Response.fromStream(stream);
      print(editproductresponse.statusCode);
      var res = json.decode(editproductresponse.body);
      if (editproductresponse.statusCode == 200 ||
        editproductresponse.statusCode == 201) {
          Navigator.pop(context);
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return UserProduct(profile_objects.pic.toString());
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }else {
      Navigator.pop(context);
      return showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('Check The Submited Data!', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
    }
      
      
    } catch (e) {
      print(e);
      Navigator.pop(context);
      return showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('Unable to Update Third Image', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
    }
      
    }
  




  Future UpdateCategory({context, groupvalue, id}) async {
    try {
    var editproductresponse;
    var upload = http.MultipartRequest(
        'PUT',
        Uri.parse(
            'http://192.168.43.231:8000/shop/usermerchantapi/$id/'));
    upload.fields['category'] = "${groupvalue}";
    upload.headers['authorization'] =
        'Token ab3802e3a5657660e52eeff04cd3ad1f4775efba';
      final stream = await upload.send();
      editproductresponse = await http.Response.fromStream(stream);

      var edithproductresponse = json.decode(editproductresponse.body);
    print(editproductresponse.body);
    if (editproductresponse.statusCode == 200 ||
        editproductresponse.statusCode == 201) {
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return UserProduct(profile_objects.pic.toString());
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
      return editproductresponse;
    } catch (e) {
      print(e);
      Navigator.pop(context);
      return showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('Unable to Update Category', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
    }
  
  }


  
  Future UploadProfileFile({username, firstname, lastname, businessname, bio, context}) async {
    var edithprofileresponse;
    var upload = http.MultipartRequest('PUT',
        Uri.parse('http://192.168.43.231:8000/shop/users/me/'));
//    var file = await http.MultipartFile.fromPath('image', _image.path);
//    upload.files.add(file);
    upload.fields['username'] = username.toString();
    upload.fields['first_name'] = firstname.toString();
    upload.fields['last_name'] = lastname.toString();
    upload.fields['bio'] = bio.toString();
    upload.fields['businessname'] = businessname.toString();
    upload.headers['authorization'] = 'Token ab3802e3a5657660e52eeff04cd3ad1f4775efba';

    try {
      final stream = await upload.send();
      edithprofileresponse = await http.Response.fromStream(stream);
      print(edithprofileresponse.statusCode);
      var res = json.decode(edithprofileresponse.body);
          if(edithprofileresponse.statusCode == 200 || edithprofileresponse.statusCode == 201){
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return Profile();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );}
      return print(res);
    } catch (e) {
      print(e);
      return null;
    }
  }


 Future UploadRequestFile({description, number, email, context, id}) async {
   var edithrequestresponse;
    var upload = http.MultipartRequest('PUT',
        Uri.parse('http://192.168.43.231:8000/shop/userrequestapi/$id/'));
    upload.fields['request_description'] = description.toString();
//    upload.fields['university'] = school.toString();
    upload.fields['phone'] = number.toString();
    upload.fields['email'] = email.toString();
    upload.headers['authorization'] = 'Token ab3802e3a5657660e52eeff04cd3ad1f4775efba';

    try {
      final stream = await upload.send();
      edithrequestresponse = await http.Response.fromStream(stream);
      print(edithrequestresponse.statusCode);
      var res = json.decode(edithrequestresponse.body);
       if(edithrequestresponse.statusCode == 200 || edithrequestresponse.statusCode == 201){
      return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return UserRequest(profile_objects.pic.toString());
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );}
      return print(res);
    } catch (e) {
      print(e);
      return null;
    }
  }



Future GetRequest() async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://192.168.43.231:8000/shop/requestapi/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token ab3802e3a5657660e52eeff04cd3ad1f4775efba"
          });
      if (res.statusCode == 200) {
        print(res.body);
        var body = jsonDecode(res.body) as List;
        List<Request> request_objects = body
            .map((request_objects_json) =>
                Request.fromJson(request_objects_json))
            .toList();
        return request_objects;
      } else {
        throw 'Cant get request';
      }
    } catch (e) {
      print('Cant get request');
      print(e);
    }
}
  


  Future GetProfile() async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://192.168.43.231:8000/shop/users/me/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token ab3802e3a5657660e52eeff04cd3ad1f4775efba"
          });
      if (res.statusCode == 200) {
        print(res.body);
        var body = jsonDecode(res.body);
       profile_objects = Profiles.fromJson(body);
      print(profile_objects);
      print(profile_objects);
        return profile_objects;
      } else {
        throw 'Cant get profile';
      }
    } catch (e) {
      print('Cant get profile');
      print(e);
    }
}



 Future GetUserProducts() async {
    try {
      var res = await http.get(
          Uri.encodeFull(
              'http://192.168.43.231:8000/shop/usermerchantapi/'),
          headers: {
            "Accept": "application/json",
            "Authorization": "Token ab3802e3a5657660e52eeff04cd3ad1f4775efba"
          });
      if (res.statusCode == 200) {
        print(res.body);
        var body = jsonDecode(res.body) as List;
        List<Products> product_objects = body
            .map((product_objects_json) =>
                Products.fromJson(product_objects_json))
            .toList();
        return product_objects;
      } else {
        throw 'Cant get products';
      }
    } catch (e) {
      print('Cant get products');
      print(e);
    }
  }



    Future deleteuserproduct(context, id) async {
                   var  deleteuserproduct = await http.delete(
                              Uri.encodeFull(
                                  'http://192.168.43.231:8000/shop/usermerchantapi/$id/'),
                              headers: {
                                "Accept": "application/json",
                                "Authorization":
                                    "Token ab3802e3a5657660e52eeff04cd3ad1f4775efba"
                              });
                    if(deleteuserproduct.statusCode == 204){
                     Navigator.pop(context);
                     return  Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return UserProduct(profile_objects.pic.toString());
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
                    }else {
      Navigator.pop(context);
      return showDialog(
        context: context,
      child: Dialog(
        backgroundColor: Colors.black12,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: 70,
          child: Center(
            child: Text('Unable to Delete Product', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      );
    }

                          return deleteuserproduct;
                        }


}