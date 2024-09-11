class RegularTransferModel {
  String? message;

  RegularTransferModel({this.message});

  RegularTransferModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}