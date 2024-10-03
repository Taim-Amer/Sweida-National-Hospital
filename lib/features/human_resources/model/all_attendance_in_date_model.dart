class AllAttendanceInDateModel {
  List<AllAttInDate>? allAttInDate;

  AllAttendanceInDateModel({this.allAttInDate});

  AllAttendanceInDateModel.fromJson(Map<String, dynamic> json) {
    if (json['All Att in Date '] != null) {
      allAttInDate = <AllAttInDate>[];
      json['All Att in Date '].forEach((v) {
        allAttInDate!.add(new AllAttInDate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allAttInDate != null) {
      data['All Att in Date '] =
          this.allAttInDate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllAttInDate {
  int? id;
  int? employeeId;
  int? dateId;
  String? createdAt;
  String? updatedAt;

  AllAttInDate(
      {this.id, this.employeeId, this.dateId, this.createdAt, this.updatedAt});

  AllAttInDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    dateId = json['date_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['date_id'] = this.dateId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}