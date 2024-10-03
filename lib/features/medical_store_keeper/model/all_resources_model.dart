class AllResoursesModel {
  List<AllResource>? allResource;

  AllResoursesModel({this.allResource});

  AllResoursesModel.fromJson(Map<String, dynamic> json) {
    if (json['All Resource'] != null) {
      allResource = <AllResource>[];
      json['All Resource'].forEach((v) {
        allResource!.add(AllResource.fromJson(v));
      });
    }
  }
}

class AllResource {
  String? id;
  String? name;
  String? endDate;
  String? company;
  String? quantity;
  String? availabilityStatus;
  Null createdAt;
  Null updatedAt;

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
    id = json['id'].toString();
    name = json['name'];
    endDate = json['end_date'];
    company = json['company'];
    quantity = json['quantity'].toString();
    availabilityStatus = json['availability_status'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}