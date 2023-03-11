class Result {
  Result({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.address, 
      this.password, 
      this.dob, 
      this.phone, 
      this.profilePic, 
      this.deviceToken, 
      this.createDate,});

  Result.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    address = json['address'];
    password = json['password'];
    dob = json['dob'];
    phone = json['phone'];
    profilePic = json['profile_pic'];
    deviceToken = json['device_token'];
    createDate = json['create_date'];
  }
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? password;
  String? dob;
  String? phone;
  String? profilePic;
  String? deviceToken;
  String? createDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['address'] = address;
    map['password'] = password;
    map['dob'] = dob;
    map['phone'] = phone;
    map['profile_pic'] = profilePic;
    map['device_token'] = deviceToken;
    map['create_date'] = createDate;
    return map;
  }

}