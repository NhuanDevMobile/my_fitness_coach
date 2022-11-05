class BodyPartsModel {
  String? id;
  String? bodyPartNameEN;
  String? bodyPartNameVN;
  String? imageUrl;

  BodyPartsModel({
    this.bodyPartNameEN,
    this.bodyPartNameVN,
    this.imageUrl,
    this.id,
  });

  BodyPartsModel.fromJson(dynamic json) {
    bodyPartNameEN = json['bodyPartNameEN'] ?? '';
    bodyPartNameVN = json['bodyPartNameVN'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
    id = json['id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bodyPartNameEN'] = bodyPartNameEN;
    map['bodyPartNameVN'] = bodyPartNameVN;
    map['imageUrl'] = imageUrl;
    map['id'] = id;

    return map;
  }
}
