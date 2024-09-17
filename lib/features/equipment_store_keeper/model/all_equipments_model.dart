class AllEquipmentsModel {
  List<AllEquipment>? allEquipment;

  AllEquipmentsModel({this.allEquipment});

  AllEquipmentsModel.fromJson(Map<String, dynamic> json) {
    if (json['All Equipment'] != null) {
      allEquipment = <AllEquipment>[];
      json['All Equipment'].forEach((v) {
        allEquipment!.add(AllEquipment.fromJson(v));
      });
    }
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
}
