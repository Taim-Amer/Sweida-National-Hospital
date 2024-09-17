class DeleteEquipmentsModel {
  String? message;

  DeleteEquipmentsModel({this.message});

  DeleteEquipmentsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
