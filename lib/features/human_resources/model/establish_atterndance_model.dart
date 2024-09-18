class EstablishAttendanceModel {
  String? theEmolyeeIdIs;
  String? hisNameIs;
  String? inDate;

  EstablishAttendanceModel({this.theEmolyeeIdIs, this.hisNameIs, this.inDate});

  EstablishAttendanceModel.fromJson(Map<String, dynamic> json) {
    theEmolyeeIdIs = json['the emolyee id is'];
    hisNameIs = json['his name is '];
    inDate = json['in date'];
  }
}
