class UserModel {
  String? email;
  String? name;
  String? uid;

  UserModel({required this.email, required this.name, required this.uid});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map['uid'];
    name = map['name'];
    email = map['email'];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
    };
  }
}
