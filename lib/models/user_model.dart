class UserModel{
  int? id;
  String? name;
  String? email;
  String? username;
  String? profilePhotoUrl;
  String? token;

  // construct

  UserModel({this.id, this.name, this.email, this.username, this.profilePhotoUrl, this.token});

  // construct dari Json
  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  // ubah construct ke json
  Map<String, dynamic>toJson(){
    return {
      'id' : id,
      'name' : name,
      'username' : username,
      'email' : email,
      'token' : token,
      'profile_photo_url' : profilePhotoUrl,
    };
  }
}