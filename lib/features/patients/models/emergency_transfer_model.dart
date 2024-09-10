class EmergencyTransferModel {
  String? message;

  EmergencyTransferModel({this.message});

  EmergencyTransferModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}