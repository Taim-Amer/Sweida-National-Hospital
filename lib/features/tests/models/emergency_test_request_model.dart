class EmergencyTestRequestModel {
  String? message;

  EmergencyTestRequestModel({this.message});

  EmergencyTestRequestModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}