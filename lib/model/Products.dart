class Products {
  int id;
  String title;
  String description;
  String email;
  String phone;
  String university;
  String price;
  String image;
  String image1;
  String image2;
  List category;
  int user;

  Products(
      {this.id,
      this.title,
      this.description,
      this.email,
      this.phone,
      this.university,
      this.price,
      this.image,
      this.image1,
      this.image2,
      this.category,
      this.user});

  factory Products.fromJson(Map<String, dynamic> json) {
   return Products(
    id : json['id'],
    title : json['title'],
    description : json['description'],
    email : json['email'],
    phone : json['phone'],
    university : json['university'],
    price : json['price'],
    image : json['image'],
    image1 : json['image1'],
    image2 : json['image2'],
    category : parsedCategory(json['category']),
    user : json['user']
    );
  }
  
  static List<int> parsedCategory (parsedcategory){
    List<int> categorylist = List<int>.from(parsedcategory);
    return categorylist;
  }
  
  }