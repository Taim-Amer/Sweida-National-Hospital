class AddRegularSurgeryModel {
  String? message;

  AddRegularSurgeryModel({this.message});

  AddRegularSurgeryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}