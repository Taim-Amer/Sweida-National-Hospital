class DeleteDeathModel {
  String? message;

  DeleteDeathModel({this.message});

  DeleteDeathModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}