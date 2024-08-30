class AcceptResidentModel {
  String? messgae;

  AcceptResidentModel({this.messgae});

  AcceptResidentModel.fromJson(Map<String, dynamic> json) {
    messgae = json['messgae'];
  }
}