class allresourcesmodel {
  List<AllResource>? allResource;

  allresourcesmodel({this.allResource});

  allresourcesmodel.fromJson(Map<String, dynamic> json) {
    if (json['All Resource'] != null) {
      allResource = <AllResource>[];
      json['All Resource'].forEach((v) {
        allResource!.add(new AllResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allResource != null) {
      data['All Resource'] = this.allResource!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllResource {
  int? id;
  String? name;
  String? endDate;
  String? company;
  String? quantity;
  int? availabilityStatus;
  Null? createdAt;
  Null? updatedAt;

  AllResource(
      {this.id,
      this.name,
      this.endDate,
      this.company,
      this.quantity,
      this.availabilityStatus,
      this.createdAt,
      this.updatedAt});

  AllResource.fromJson(Map<String, dynamic> json) {
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
