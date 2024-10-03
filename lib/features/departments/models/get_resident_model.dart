class GetResidentModel {
  String? message;

  GetResidentModel({this.message});

  GetResidentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}