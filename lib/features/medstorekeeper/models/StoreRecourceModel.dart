class StoreRecourceModel {
  NewResource? newResource;

  StoreRecourceModel({this.newResource});

  StoreRecourceModel.fromJson(Map<String, dynamic> json) {
    newResource = json['New Resource'] != null
        ? new NewResource.fromJson(json['New Resource'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newResource != null) {
      data['New Resource'] = this.newResource!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['end_date'] = this.endDate;
    data['company'] = this.company;
    data['quantity'] = this.quantity;
    data['availability_status'] = this.availabilityStatus;
    data['id'] = this.id;
    return data;
  }
}
