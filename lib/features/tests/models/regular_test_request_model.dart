class RegularTestRequestModel {
  String? message;

  RegularTestRequestModel({this.message});

  RegularTestRequestModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}