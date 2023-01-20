class LoginModel {
  bool? status;
  String? accessToken;
  String? tokenType;
  int? userId;
  String? fullName;
  String? email;
  String? phone;
  String? profilePicture;
  String? createdAt;

  LoginModel(
      {this.status,
      this.accessToken,
      this.tokenType,
      this.userId,
      this.fullName,
      this.email,
      this.phone,
      this.profilePicture,
      this.createdAt});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    userId = json['user_id'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    profilePicture = json['profilePicture'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['user_id'] = this.userId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['profilePicture'] = this.profilePicture;
    data['created_at'] = this.createdAt;
    return data;
  }
}
