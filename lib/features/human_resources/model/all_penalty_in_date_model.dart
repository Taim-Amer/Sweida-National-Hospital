class AllPenaltyInDateModel {
  List<AllPenaltyInDate>? allPenaltyInDate;

  AllPenaltyInDateModel({this.allPenaltyInDate});

  AllPenaltyInDateModel.fromJson(Map<String, dynamic> json) {
    if (json['All Penalty in Date '] != null) {
      allPenaltyInDate = <AllPenaltyInDate>[];
      json['All Penalty in Date '].forEach((v) {
        allPenaltyInDate!.add(new AllPenaltyInDate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allPenaltyInDate != null) {
      data['All Penalty in Date '] =
          this.allPenaltyInDate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllPenaltyInDate {
  int? id;
  int? employeeId;
  int? dateId;
  int? vacation;
  String? createdAt;
  String? updatedAt;

  AllPenaltyInDate(
      {this.id,
        this.employeeId,
        this.dateId,
        this.vacation,
        this.createdAt,
        this.updatedAt});

  AllPenaltyInDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    dateId = json['date_id'];
    vacation = json['vacation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['date_id'] = this.dateId;
    data['vacation'] = this.vacation;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}