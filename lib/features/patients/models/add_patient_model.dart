class AddPatientModel {
  String? message;

  AddPatientModel({this.message});

  AddPatientModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}