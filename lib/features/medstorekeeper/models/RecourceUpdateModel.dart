class RecourceUpdateModel {
  TheResourceUpdate? theResourceUpdate;

  RecourceUpdateModel({this.theResourceUpdate});

  RecourceUpdateModel.fromJson(Map<String, dynamic> json) {
    theResourceUpdate = json['The Resource Update'] != null
        ? new TheResourceUpdate.fromJson(json['The Resource Update'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.theResourceUpdate != null) {
      data['The Resource Update'] = this.theResourceUpdate!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['end_date'] = this.endDate;
    data['company'] = this.company;
    data['quantity'] = this.quantity;
    data['availability_status'] = this.availabilityStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
