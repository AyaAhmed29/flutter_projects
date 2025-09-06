// class UserModel {
//   String? uid;
//   late String userName;
//   late String email;
//   String? image;

//   UserModel({
//     required this.userName,
//     this.image,
//     required this.uid,
//     required this.email,
//   });
//   UserModel.fromJson(Map<String, dynamic> json) {
//     uid = json['id'];
//     userName = json['name'];
//     email = json['email'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     return {'id': uid, 'name': userName, 'email': email, 'image': image};
//   }
// }
  class LoginResponseModel {
  String? accessToken;
  String? refreshToken;
  bool? status;
  UserModel? user;

  LoginResponseModel(
      {this.accessToken, this.refreshToken, this.status, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    status = json['status'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? email;
  List<Null>? favoriteProducts;
  int? id;
  String? imagePath;
  String? name;
  String? phone;

  UserModel(
      {this.email,
        this.favoriteProducts,
        this.id,
        this.imagePath,
        this.name,
        this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    if (json['favorite_products'] != null) {
      // favoriteProducts = <Null>[];
      // json['favorite_products'].forEach((v) {
      //   favoriteProducts!.add(new Null.fromJson(v));
      // });
    }
    id = json['id'];
    imagePath = json['image_path'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    // if (this.favoriteProducts != null) {
    //   data['favorite_products'] =
    //       this.favoriteProducts!.map((v) => v.toJson()).toList();
    // }
    data['id'] = this.id;
    data['image_path'] = this.imagePath;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}
