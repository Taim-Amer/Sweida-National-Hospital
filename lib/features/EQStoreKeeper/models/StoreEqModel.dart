class StoreEqModel {
  NewEquipment? newEquipment;

  StoreEqModel({this.newEquipment});

  StoreEqModel.fromJson(Map<String, dynamic> json) {
    newEquipment = json['New Equipment'] != null
        ? new NewEquipment.fromJson(json['New Equipment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newEquipment != null) {
      data['New Equipment'] = this.newEquipment!.toJson();
    }
    return data;
  }
}

class NewEquipment {
  String? name;
  String? description;
  String? quantity;
  String? updatedAt;
  String? createdAt;
  int? id;

  NewEquipment(
      {this.name,
        this.description,
        this.quantity,
        this.updatedAt,
        this.createdAt,
        this.id});

  NewEquipment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
