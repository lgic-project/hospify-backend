class PaaccModel {
  bool? status;
  String? message;
  Data? data;

  PaaccModel({this.status, this.message, this.data});

  PaaccModel.fromJson(Map<String, dynamic> json) {
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
  int? paId;
  String? fname;
  String? lname;
  dynamic address;
  dynamic city;
  dynamic pnm;
  dynamic gender;
  dynamic age;
  dynamic weight;
  dynamic mh;
  String? email;
  dynamic status;
  String? password;
  dynamic img1;
  dynamic role;
  int? id;
  dynamic dptId;
  dynamic rememberToken;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.paId,
      this.fname,
      this.lname,
      this.address,
      this.city,
      this.pnm,
      this.gender,
      this.age,
      this.weight,
      this.mh,
      this.email,
      this.status,
      this.password,
      this.img1,
      this.role,
      this.id,
      this.dptId,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    paId = json['pa_id'];
    fname = json['fname'];
    lname = json['lname'];
    address = json['address'];
    city = json['city'];
    pnm = json['pnm'];
    gender = json['gender'];
    age = json['age'];
    weight = json['weight'];
    mh = json['mh'];
    email = json['email'];
    status = json['status'];
    password = json['password'];
    img1 = json['img1'];
    role = json['role'];
    id = json['id'];
    dptId = json['dpt_id'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pa_id'] = this.paId;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['address'] = this.address;
    data['city'] = this.city;
    data['pnm'] = this.pnm;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['mh'] = this.mh;
    data['email'] = this.email;
    data['status'] = this.status;
    data['password'] = this.password;
    data['img1'] = this.img1;
    data['role'] = this.role;
    data['id'] = this.id;
    data['dpt_id'] = this.dptId;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
