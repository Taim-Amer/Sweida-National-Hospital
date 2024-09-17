class ShowEquipmentsModel {
  ThisEquipment? thisEquipment;

  ShowEquipmentsModel({this.thisEquipment});

  ShowEquipmentsModel.fromJson(Map<String, dynamic> json) {
    thisEquipment = json['This Equipment'] != null
        ? new ThisEquipment.fromJson(json['This Equipment'])
        : null;
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
}
