class AllEmergencyPatientModel {
  List<AllEmergencyPatient>? allEmergencyPatient;

  AllEmergencyPatientModel({this.allEmergencyPatient});

  AllEmergencyPatientModel.fromJson(Map<String, dynamic> json) {
    if (json['All Emergency Patient'] != null) {
      allEmergencyPatient = <AllEmergencyPatient>[];
      json['All Emergency Patient'].forEach((v) {
        allEmergencyPatient!.add(AllEmergencyPatient.fromJson(v));
      });
    }
  }
}

class AllEmergencyPatient {
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

  AllEmergencyPatient(
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

  AllEmergencyPatient.fromJson(Map<String, dynamic> json) {
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