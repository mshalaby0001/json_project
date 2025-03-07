
class User {
  final String name;
  final String email;
  User({required this.name,required this.email});
  
  // deserialize (json => object)
  User.fromJson(Map<String, dynamic> json) 
  : name = json['name'] as String,
    email = json['email'] as String;

  
  // serialization (object => json)
  Map<String,dynamic> toJson() => {
    'name' : name,
    'email' : email
  };

  int plantTree(int treeCount){
    print('tree');
    return 1;
  }
}