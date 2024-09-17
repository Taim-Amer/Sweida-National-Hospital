class StoreEquipmentsModel {
  NewEquipment? newEquipment;

  StoreEquipmentsModel({this.newEquipment});

  StoreEquipmentsModel.fromJson(Map<String, dynamic> json) {
    newEquipment = json['New Equipment'] != null
        ? NewEquipment.fromJson(json['New Equipment'])
        : null;
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
}
