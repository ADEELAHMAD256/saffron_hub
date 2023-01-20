class RegistrationModel {
  bool? status;
  int? userId;
  String? name;
  String? phone;
  String? email;
  String? password;

  RegistrationModel({
    this.status,
    this.userId,
    this.name,
    this.phone,
    this.email,
    this.password,
  });

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userId = json['user_id'];
    name = json['firstname'];
    phone = json['mobile'];
    email = json['email'];
    password = json['qualification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['user_id'] = userId;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['firstname'] = name;

    return data;
  }
  // Map<String, dynamic> toJson() {
  //   Map<String, dynamic> data = Map<String, dynamic>();
  //   data['status'] = status;
  //   data['user_id'] = userId;
  //   data['firstname'] = name;
  //   data['mobile'] = mobile;
  //   data['email'] = email;
  //   data['qualification'] = password;
  //
  //   return data;
  // }
}
