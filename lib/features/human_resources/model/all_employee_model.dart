class AllEmployeeModel {
  List<AllEmployees>? allEmployees;

  AllEmployeeModel({this.allEmployees});

  AllEmployeeModel.fromJson(Map<String, dynamic> json) {
    if (json['All Employees '] != null) {
      allEmployees = <AllEmployees>[];
      json['All Employees '].forEach((v) {
        allEmployees!.add(AllEmployees.fromJson(v));
      });
    }
  }
}

class AllEmployees {
  int? id;
  String? name;
  int? departmentId;
  String? createdAt;
  String? updatedAt;

  AllEmployees(
      {this.id, this.name, this.departmentId, this.createdAt, this.updatedAt});

  AllEmployees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    departmentId = json['department_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}