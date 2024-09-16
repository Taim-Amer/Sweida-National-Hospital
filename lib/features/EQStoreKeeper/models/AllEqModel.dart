class AllEqModel {
  List<AllEquipment>? allEquipment;

  AllEqModel({this.allEquipment});

  AllEqModel.fromJson(Map<String, dynamic> json) {
    if (json['All Equipment'] != null) {
      allEquipment = <AllEquipment>[];
      json['All Equipment'].forEach((v) {
        allEquipment!.add(new AllEquipment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allEquipment != null) {
      data['All Equipment'] =
          this.allEquipment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllEquipment {
  int? id;
  String? name;
  String? description;
  int? quantity;
  String? createdAt;
  String? updatedAt;

  AllEquipment(
      {this.id,
        this.name,
        this.description,
        this.quantity,
        this.createdAt,
        this.updatedAt});

  AllEquipment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
