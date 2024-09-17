class DeathByDateModel {
  List<DeathsByDay>? deathsByDay;

  DeathByDateModel({this.deathsByDay});

  DeathByDateModel.fromJson(Map<String, dynamic> json) {
    if (json['Deaths By Day'] != null) {
      deathsByDay = <DeathsByDay>[];
      json['Deaths By Day'].forEach((v) {
        deathsByDay!.add(new DeathsByDay.fromJson(v));
      });
    }
  }
}

class DeathsByDay {
  int? id;
  String? name;
  String? fatherName;
  String? momName;
  String? birthDate;
  String? city;
  String? nationalId;
  String? deathDate;
  String? deathHour;
  String? reasonOfDeath;
  String? createdAt;
  String? updatedAt;

  DeathsByDay(
      {this.id,
        this.name,
        this.fatherName,
        this.momName,
        this.birthDate,
        this.city,
        this.nationalId,
        this.deathDate,
        this.deathHour,
        this.reasonOfDeath,
        this.createdAt,
        this.updatedAt});

  DeathsByDay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fatherName = json['father_name'];
    momName = json['mom_name'];
    birthDate = json['birth_date'];
    city = json['city'];
    nationalId = json['National_id'];
    deathDate = json['death_date'];
    deathHour = json['death_hour'];
    reasonOfDeath = json['reason_of_death'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}