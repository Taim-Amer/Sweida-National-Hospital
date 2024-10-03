class DeleteEmployeeModel {
  String? message;

  DeleteEmployeeModel({this.message});

  DeleteEmployeeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}