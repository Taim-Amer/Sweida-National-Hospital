class GetRegularXrayModel {
  String? message;

  GetRegularXrayModel({this.message});

  GetRegularXrayModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}