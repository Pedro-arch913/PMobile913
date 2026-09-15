class User{
  late String id;
  late String email;
  late String password;

  User({required this.id, required this.email, required this.password});

  User.fromJson(Map<String, dynamic> json){
    id = json['id'].toString();
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'email': email,
      'password': password,
    };
  }
}