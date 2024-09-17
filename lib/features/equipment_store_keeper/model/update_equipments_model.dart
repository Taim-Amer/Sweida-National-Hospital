class UpdateEquipmentsModel {
  TheEquipmentUpdate? theEquipmentUpdate;

  UpdateEquipmentsModel({this.theEquipmentUpdate});

  UpdateEquipmentsModel.fromJson(Map<String, dynamic> json) {
    theEquipmentUpdate = json['The Equipment Update '] != null
        ? TheEquipmentUpdate.fromJson(json['The Equipment Update '])
        : null;
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
}
