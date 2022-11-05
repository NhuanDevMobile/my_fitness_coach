class UserModel {
  String? uid;
  String? id;
  String? phone;
  String? sex;
  String? mobile;
  String? email;
  String? firstName;
  String? lastName;
  String? dob;
  String? created;
  String? updated;
  String? address1;
  String? address2;
  String? provider;
  String? avatarURL;
  String? coverPhotoURL;
  String? createdAvatar;
  String? createdCoverPhoto;
  bool? status;
  String? tokenFCM;
  bool? isDelete;
  List<String>? keywords;
  int? weight;
  int? height;

  UserModel({
    String? uid,
    String? id,
    String? phone,
    String? sex,
    String? mobile,
    String? email,
    String? firstName,
    String? lastName,
    String? dob,
    String? created,
    String? updated,
    String? address1,
    String? address2,
    String? provider,
    String? avatarURL,
    String? coverPhotoURL,
    String? createdAvatar,
    String? createdCoverPhoto,
    bool? status,
    String? tokenFCM,
    bool? isDelete,
    List<String>? keywords,
    int? weight,
    int? height,
  }) {
    this.uid = uid;
    this.id = id;
    this.phone = phone;
    this.sex = sex;
    this.mobile = mobile;
    this.email = email;
    this.firstName = firstName;
    this.lastName = lastName;
    this.dob = dob;
    this.created = created;
    this.updated = updated;
    this.address1 = address1;
    this.address2 = address2;
    this.provider = provider;
    this.avatarURL = avatarURL;
    this.coverPhotoURL = coverPhotoURL;
    this.createdAvatar = createdAvatar;
    this.createdCoverPhoto = createdCoverPhoto;
    this.status = status;
    this.tokenFCM = tokenFCM;
    this.isDelete = isDelete;
    this.keywords = keywords;
    this.weight = weight;
    this.height = height;
  }

  UserModel.fromJson(dynamic json) {
    uid = json['uid'] ?? '';
    id = json['id'] ?? '';
    phone = json['phone'] ?? '';
    sex = json['sex'] ?? '';
    mobile = json['mobile'] ?? '';
    email = json['email'];
    firstName = json['firstName'] ?? '';
    lastName = json['lastName'];
    dob = json['dob'];
    created = json['created'];
    updated = json['updated'];
    address1 = json['address1'];
    address2 = json['address2'];
    provider = json['provider'];
    avatarURL = json['avatarURL'];
    coverPhotoURL = json['coverPhotoURL'];
    createdAvatar = json['createdAvatar'];
    createdCoverPhoto = json['createdCoverPhoto'];
    status = json['status'];
    tokenFCM = json['tokenFCM'];
    isDelete = json['isDelete'] ?? true;
    weight = json['weight'];
    height = json['height'];
    if (json['keywords'] != null) {
      var listkeywords = json['keywords'] as List;
      keywords = listkeywords.map((i) => i.toString()).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = uid;
    map['id'] = id;
    map['phone'] = phone;
    map['sex'] = sex;
    map['mobile'] = mobile;
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['dob'] = dob;
    map['created'] = created;
    map['updated'] = updated;
    map['address1'] = address1;
    map['address2'] = address2;
    map['provider'] = provider;
    map['avatarURL'] = avatarURL;
    map['coverPhotoURL'] = coverPhotoURL;
    map['createdAvatar'] = createdAvatar;
    map['createdCoverPhoto'] = createdCoverPhoto;
    map['status'] = status;
    map['tokenFCM'] = tokenFCM;
    map['isDelete'] = isDelete;
    map['keywords'] = keywords;
    map['weight'] = weight;
    map['height'] = height;
    return map;
  }

  String? fullName() {
    String fullName = '';
    if (lastName != null) {
      fullName = fullName + lastName! + ' ';
    }
    if (firstName != null) {
      fullName = fullName + firstName!;
    }
    return fullName;
  }

  // getAge() {
  //   String age = "0";
  //   if (dob != null) {
  //     String date = TimeHelper.timestampToString(dob, "dd/MM/yyyy");
  //     DateTime? dateLove = TimeHelper.stringToDateTime(date.toString());
  //     final CurrentDate = DateTime.now();
  //     age = CurrentDate.difference(dateLove!).inDays.toString();
  //     if (int.parse(age) < 0) {
  //       return "0";
  //     } else {
  //       return age;
  //     }
  //   } else {
  //     return "0";
  //   }
  // }
  //
  // getIconSex() {
  //   String icon = "assets/icons/ic_gender.png";
  //   if (sex == "Nam") {
  //     return "assets/icons/ic_male.png";
  //   } else if (sex == "Nữ") {
  //     return "assets/icons/ic_female.png";
  //   } else {
  //     return "assets/icons/ic_gender.png";
  //   }
  // }
}
