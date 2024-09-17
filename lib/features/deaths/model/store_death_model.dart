class StoreDeathModel {
  TheNewDeath? theNewDeath;
  String? message;

  StoreDeathModel({this.theNewDeath, this.message});

  StoreDeathModel.fromJson(Map<String, dynamic> json) {
    theNewDeath = json['The new Death'] != null
        ? new TheNewDeath.fromJson(json['The new Death'])
        : null;
    message = json['Message'];
  }
}

class TheNewDeath {
  String? name;
  String? fatherName;
  String? momName;
  String? birthDate;
  String? city;
  String? nationalId;
  String? deathDate;
  String? deathHour;
  String? reasonOfDeath;
  String? updatedAt;
  String? createdAt;
  int? id;

  TheNewDeath(
      {this.name,
        this.fatherName,
        this.momName,
        this.birthDate,
        this.city,
        this.nationalId,
        this.deathDate,
        this.deathHour,
        this.reasonOfDeath,
        this.updatedAt,
        this.createdAt,
        this.id});

  TheNewDeath.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fatherName = json['father_name'];
    momName = json['mom_name'];
    birthDate = json['birth_date'];
    city = json['city'];
    nationalId = json['National_id'];
    deathDate = json['death_date'];
    deathHour = json['death_hour'];
    reasonOfDeath = json['reason_of_death'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}