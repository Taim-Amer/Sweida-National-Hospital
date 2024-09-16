class AddEmergencySurgeryModel {
  String? message;

  AddEmergencySurgeryModel({this.message});

  AddEmergencySurgeryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}