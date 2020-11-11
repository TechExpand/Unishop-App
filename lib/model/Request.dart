class Request {
  int id;
  String request_description;
  String request_date;
  String phone;
  String email;
  int user;


  Request(
      {this.id,
      this.request_description,
      this.request_date,
      this.phone,
      this.email,
      this.user,
     });

  factory Request.fromJson(Map<String, dynamic> json) {
   return Request(
    id : json['id'],
    request_date : json['request_date'],
    email : json['email'],
    phone : json['phone'],
    user : json['user'],
    request_description : json['request_description'],
    );
  }
  
  
  }