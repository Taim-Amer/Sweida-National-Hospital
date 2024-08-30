class SpecificDepartmentModel {
  DepDetails? depDetails;

  SpecificDepartmentModel({this.depDetails});

  SpecificDepartmentModel.fromJson(Map<String, dynamic> json) {
    depDetails = json['dep_details'] != null
        ? DepDetails.fromJson(json['dep_details'])
        : null;
  }
}

class DepDetails {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  DepDetails({this.id, this.name, this.createdAt, this.updatedAt});

  DepDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}