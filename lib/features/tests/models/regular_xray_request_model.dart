class RegularXrayRequestModel {
  String? message;

  RegularXrayRequestModel({this.message});

  RegularXrayRequestModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}