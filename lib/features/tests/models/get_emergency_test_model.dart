class GetEmergencyTestModel {
  String? message;

  GetEmergencyTestModel({this.message});

  GetEmergencyTestModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}