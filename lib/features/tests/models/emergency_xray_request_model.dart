class EmergencyXrayRequestModel {
  String? message;

  EmergencyXrayRequestModel({this.message});

  EmergencyXrayRequestModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}