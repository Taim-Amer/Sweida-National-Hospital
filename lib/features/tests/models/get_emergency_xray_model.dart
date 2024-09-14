class GetEmergencyXrayModel {
  String? message;

  GetEmergencyXrayModel({this.message});

  GetEmergencyXrayModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}