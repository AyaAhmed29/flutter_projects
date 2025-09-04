class UserModel {
  String? uid;
  late String userName;
  late String email;
  String? image;

  UserModel({
    required this.userName,
    this.image,
    required this.uid,
    required this.email,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['id'];
    userName = json['name'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {'id': uid, 'name': userName, 'email': email, 'image': image};
  }
}
