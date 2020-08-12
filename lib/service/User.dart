class User {
  int id;
  String username ;
  String email;
  String password;

  User(this.username, this.email, this.password, this.id);

  // Convert Employee object into a Map object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'username': username,
      'email': email,
      'password' : password,
      'id' : id,
    };
    return map;
  }

  // Extract Employee object from a Map object
  User.fromMap(Map<String, dynamic> map) {
    username = map['username'];
    email = map['email'];
    password = map['password'];
    id = map['id'];
  }
}