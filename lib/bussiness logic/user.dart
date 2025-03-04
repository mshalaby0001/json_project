
class User {
  final String name;
  final String email;
  User(this.name, this.email);
  // deserialize (json => object)
  User.fromJson(Map<String, dynamic> json) 
  : name = json['name'] as String,
    email = json['email'] as String;
  // serialization (object => json)
  Map<String,dynamic> tojson() => {
    'name' : name,
    'email' : email
  };
}