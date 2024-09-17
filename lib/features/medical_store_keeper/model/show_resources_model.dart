class ShowResourcesModel {
  ThisResource? thisResource;

  ShowResourcesModel({this.thisResource});

  ShowResourcesModel.fromJson(Map<String, dynamic> json) {
    thisResource = json['This Resource'] != null
        ? ThisResource.fromJson(json['This Resource'])
        : null;
  }
}

class ThisResource {
  int? id;
  String? name;
  String? endDate;
  String? company;
  String? quantity;
  int? availabilityStatus;
  Null? createdAt;
  Null? updatedAt;

  ThisResource(
      {this.id,
        this.name,
        this.endDate,
        this.company,
        this.quantity,
        this.availabilityStatus,
        this.createdAt,
        this.updatedAt});

  ThisResource.fromJson(Map<String, dynamic> json) {
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