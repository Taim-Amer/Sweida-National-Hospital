class ShowEqModel {
  ThisEquipment? thisEquipment;

  ShowEqModel({this.thisEquipment});

  ShowEqModel.fromJson(Map<String, dynamic> json) {
    thisEquipment = json['This Equipment'] != null
        ? new ThisEquipment.fromJson(json['This Equipment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thisEquipment != null) {
      data['This Equipment'] = this.thisEquipment!.toJson();
    }
    return data;
  }
}

class ThisEquipment {
  int? id;
  String? name;
  String? description;
  int? quantity;
  String? createdAt;
  String? updatedAt;

  ThisEquipment(
      {this.id,
        this.name,
        this.description,
        this.quantity,
        this.createdAt,
        this.updatedAt});

  ThisEquipment.fromJson(Map<String, dynamic> json) {
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
