class DeleteResoursesModel {
  String? message;

  DeleteResoursesModel({this.message});

  DeleteResoursesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}