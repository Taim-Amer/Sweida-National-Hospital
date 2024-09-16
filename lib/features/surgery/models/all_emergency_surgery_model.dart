class AllEmergencySurgeryModel {
  List<AllPatientInSurgryQueue>? allPatientInSurgryQueue;

  AllEmergencySurgeryModel({this.allPatientInSurgryQueue});

  AllEmergencySurgeryModel.fromJson(Map<String, dynamic> json) {
    if (json['All patient in surgry queue'] != null) {
      allPatientInSurgryQueue = <AllPatientInSurgryQueue>[];
      json['All patient in surgry queue'].forEach((v) {
        allPatientInSurgryQueue!.add(AllPatientInSurgryQueue.fromJson(v));
      });
    }
  }
}

class AllPatientInSurgryQueue {
  int? id;
  int? patientId;
  String? createdAt;
  String? updatedAt;
  Patient? patient;

  AllPatientInSurgryQueue(
      {this.id, this.patientId, this.createdAt, this.updatedAt, this.patient});

  AllPatientInSurgryQueue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    patient =
    json['patient'] != null ? Patient.fromJson(json['patient']) : null;
  }
}

class Patient {
  int? id;
  String? fullName;
  String? address;
  String? dateOfBirth;
  String? momName;
  int? chain;
  String? gender;
  String? caseDescription;
  String? treatmentRequired;
  String? createdAt;
  String? updatedAt;

  Patient(
      {this.id,
        this.fullName,
        this.address,
        this.dateOfBirth,
        this.momName,
        this.chain,
        this.gender,
        this.caseDescription,
        this.treatmentRequired,
        this.createdAt,
        this.updatedAt});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    address = json['address'];
    dateOfBirth = json['date_of_birth'];
    momName = json['mom_name'];
    chain = json['chain'];
    gender = json['gender'];
    caseDescription = json['case_description'];
    treatmentRequired = json['treatment_required'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}