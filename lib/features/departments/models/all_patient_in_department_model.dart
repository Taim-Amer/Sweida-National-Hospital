class AllPatientInDepartmentModel {
  List<AllPatientThisDepartment>? allPatientThisDepartment;

  AllPatientInDepartmentModel({this.allPatientThisDepartment});

  AllPatientInDepartmentModel.fromJson(Map<String, dynamic> json) {
    if (json['All Patient this Department '] != null) {
      allPatientThisDepartment = <AllPatientThisDepartment>[];
      json['All Patient this Department '].forEach((v) {
        allPatientThisDepartment!.add(AllPatientThisDepartment.fromJson(v));
      });
    }
  }
}

class AllPatientThisDepartment {
  int? patientId;
  String? patientName;

  AllPatientThisDepartment({this.patientId, this.patientName});

  AllPatientThisDepartment.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    patientName = json['patient_name'];
  }
}