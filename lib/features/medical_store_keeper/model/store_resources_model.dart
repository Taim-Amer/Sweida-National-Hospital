class StoreResoursesModel {
  NewResource? newResource;

  StoreResoursesModel({this.newResource});

  StoreResoursesModel.fromJson(Map<String, dynamic> json) {
    newResource = json['New Resource'] != null
        ? NewResource.fromJson(json['New Resource'])
        : null;
  }
}

class NewResource {
  String? name;
  String? endDate;
  String? company;
  String? quantity;
  String? availabilityStatus;
  int? id;

  NewResource(
      {this.name,
        this.endDate,
        this.company,
        this.quantity,
        this.availabilityStatus,
        this.id});

  NewResource.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    endDate = json['end_date'];
    company = json['company'];
    quantity = json['quantity'];
    availabilityStatus = json['availability_status'];
    id = json['id'];
  }
}