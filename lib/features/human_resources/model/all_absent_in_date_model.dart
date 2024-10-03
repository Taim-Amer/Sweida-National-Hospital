class AllAbsentInDateModel {
  List<AllAbcentInDate>? allAbcentInDate;

  AllAbsentInDateModel({this.allAbcentInDate});

  AllAbsentInDateModel.fromJson(Map<String, dynamic> json) {
    if (json['All Abcent in Date '] != null) {
      allAbcentInDate = <AllAbcentInDate>[];
      json['All Abcent in Date '].forEach((v) {
        allAbcentInDate!.add(AllAbcentInDate.fromJson(v));
      });
    }
  }
}

class AllAbcentInDate {
  int? id;
  int? employeeId;
  int? dateId;
  int? vacation;
  String? createdAt;
  String? updatedAt;

  AllAbcentInDate(
      {this.id,
        this.employeeId,
        this.dateId,
        this.vacation,
        this.createdAt,
        this.updatedAt});

  AllAbcentInDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    dateId = json['date_id'];
    vacation = json['vacation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}