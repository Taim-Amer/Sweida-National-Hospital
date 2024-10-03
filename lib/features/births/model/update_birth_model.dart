class UpdateBirthModel {
  TheBirthUpdateIs? theBirthUpdateIs;

  UpdateBirthModel({this.theBirthUpdateIs});

  UpdateBirthModel.fromJson(Map<String, dynamic> json) {
    theBirthUpdateIs = json['The Birth update is'] != null
        ? TheBirthUpdateIs.fromJson(json['The Birth update is'])
        : null;
  }
}

class TheBirthUpdateIs {
  int? id;
  String? name;
  String? fatherName;
  String? motherName;
  String? birthDate;
  String? city;
  String? nationalId;
  String? createdAt;
  String? updatedAt;

  TheBirthUpdateIs(
      {this.id,
        this.name,
        this.fatherName,
        this.motherName,
        this.birthDate,
        this.city,
        this.nationalId,
        this.createdAt,
        this.updatedAt});

  TheBirthUpdateIs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    birthDate = json['birth_date'];
    city = json['city'];
    nationalId = json['national_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}