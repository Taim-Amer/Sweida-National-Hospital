class GetRegularTestModel {
  String? message;

  GetRegularTestModel({this.message});

  GetRegularTestModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}