class UpdateEqModel {
  TheEquipmentUpdate? theEquipmentUpdate;

  UpdateEqModel({this.theEquipmentUpdate});

  UpdateEqModel.fromJson(Map<String, dynamic> json) {
    theEquipmentUpdate = json['The Equipment Update '] != null
        ? new TheEquipmentUpdate.fromJson(json['The Equipment Update '])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.theEquipmentUpdate != null) {
      data['The Equipment Update '] = this.theEquipmentUpdate!.toJson();
    }
    return data;
  }
}

class TheEquipmentUpdate {
  int? id;
  String? name;
  String? description;
  String? quantity;
  String? createdAt;
  String? updatedAt;

  TheEquipmentUpdate(
      {this.id,
        this.name,
        this.description,
        this.quantity,
        this.createdAt,
        this.updatedAt});

  TheEquipmentUpdate.fromJson(Map<String, dynamic> json) {
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
