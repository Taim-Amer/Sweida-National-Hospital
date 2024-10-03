class AllBirthsModel {
  List<AllBirth>? allBirth;

  AllBirthsModel({this.allBirth});

  AllBirthsModel.fromJson(Map<String, dynamic> json) {
    if (json['All Birth'] != null) {
      allBirth = <AllBirth>[];
      json['All Birth'].forEach((v) {
        allBirth!.add(AllBirth.fromJson(v));
      });
    }
  }
}

class AllBirth {
  int? id;
  String? name;
  String? fatherName;
  String? motherName;
  String? birthDate;
  String? city;
  String? nationalId;
  String? createdAt;
  String? updatedAt;

  AllBirth(
      {this.id,
        this.name,
        this.fatherName,
        this.motherName,
        this.birthDate,
        this.city,
        this.nationalId,
        this.createdAt,
        this.updatedAt});

  AllBirth.fromJson(Map<String, dynamic> json) {
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