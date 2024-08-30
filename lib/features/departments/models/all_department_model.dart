class AllDepartmentModel {
  List<AllDepartments>? allDepartments;

  AllDepartmentModel({this.allDepartments});

  AllDepartmentModel.fromJson(Map<String, dynamic> json) {
    if (json['All Departments'] != null) {
      allDepartments = <AllDepartments>[];
      json['All Departments'].forEach((v) {
        allDepartments!.add(AllDepartments.fromJson(v));
      });
    }
  }
}

class AllDepartments {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  AllDepartments({this.id, this.name, this.createdAt, this.updatedAt});

  AllDepartments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}