class Profiles {
    String username;
    String first_name;
    String last_name;
    String bio;
    String pic;
    String businessname;
    int id;
    String email;


  Profiles(
      {this.username,
      this.first_name,
      this.last_name,
      this.bio,
      this.pic,
      this.businessname,
      this.id,
      this.email,
     });

  factory Profiles.fromJson(Map<String, dynamic> json) {
   return Profiles(
    id : json['id'],
    username : json['username'],
    first_name : json['first_name'],
    last_name : json['last_name'],
    bio : json['bio'],
    pic : json['pic'],
    businessname : json['businessname'],
    email : json['email'],
    );
  }
  }