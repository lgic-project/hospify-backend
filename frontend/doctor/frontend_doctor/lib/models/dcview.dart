class dcdetailsmodel {
  bool? status;
  String? message;
  Data? data;

  dcdetailsmodel({this.status, this.message, this.data});

  dcdetailsmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? dcId;
  String? fname;
  String? lname;
  String? address;
  String? city;
  int? pnm;
  String? gender;
  int? age;
  String? email;
  String? password;
  Null? img1;
  String? role;
  Null? dptId;
  Null? rememberToken;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.dcId,
      this.fname,
      this.lname,
      this.address,
      this.city,
      this.pnm,
      this.gender,
      this.age,
      this.email,
      this.password,
      this.img1,
      this.role,
      this.dptId,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    dcId = json['dc_id'];
    fname = json['fname'];
    lname = json['lname'];
    address = json['address'];
    city = json['city'];
    pnm = json['pnm'];
    gender = json['gender'];
    age = json['age'];
    email = json['email'];
    password = json['password'];
    img1 = json['img1'];
    role = json['role'];
    dptId = json['dpt_id'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dc_id'] = this.dcId;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['address'] = this.address;
    data['city'] = this.city;
    data['pnm'] = this.pnm;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['email'] = this.email;
    data['password'] = this.password;
    data['img1'] = this.img1;
    data['role'] = this.role;
    data['dpt_id'] = this.dptId;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
