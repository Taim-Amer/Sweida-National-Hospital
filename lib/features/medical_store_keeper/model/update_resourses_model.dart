class UpdateResoursesModel {
  TheResourceUpdate? theResourceUpdate;

  UpdateResoursesModel({this.theResourceUpdate});

  UpdateResoursesModel.fromJson(Map<String, dynamic> json) {
    theResourceUpdate = json['The Resource Update'] != null
        ? TheResourceUpdate.fromJson(json['The Resource Update'])
        : null;
  }
}

class TheResourceUpdate {
  int? id;
  String? name;
  String? endDate;
  String? company;
  String? quantity;
  String? availabilityStatus;
  Null? createdAt;
  Null? updatedAt;

  TheResourceUpdate(
      {this.id,
        this.name,
        this.endDate,
        this.company,
        this.quantity,
        this.availabilityStatus,
        this.createdAt,
        this.updatedAt});

  TheResourceUpdate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    endDate = json['end_date'];
    company = json['company'];
    quantity = json['quantity'];
    availabilityStatus = json['availability_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}