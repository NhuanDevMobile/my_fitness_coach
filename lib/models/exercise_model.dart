class ExerciseModel {
  String? bodyPart;
  String? equipment;
  String? gifUrl;
  String? id;
  String? name;
  String? nameVN;
  String? target;

  ExerciseModel({
    this.bodyPart,
    this.equipment,
    this.gifUrl,
    this.id,
    this.name,
    this.nameVN,
    this.target,
  });

  ExerciseModel.fromJson(dynamic json) {
    bodyPart = json['bodyPart'] ?? '';
    equipment = json['equipment'] ?? '';
    gifUrl = json['gifUrl'] ?? '';
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    nameVN = json['nameVN'] ?? '';
    target = json['target'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bodyPart'] = bodyPart;
    map['equipment'] = equipment;
    map['gifUrl'] = gifUrl;
    map['id'] = id;
    map['name'] = name;
    map['nameVN'] = nameVN;
    map['target'] = target;

    return map;
  }
}
