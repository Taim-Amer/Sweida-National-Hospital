class LogoutModel {
  String? message;

  LogoutModel(this.message);

  LogoutModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
  }
}