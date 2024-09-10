class PatientFileModel {
  Data? data;

  PatientFileModel({this.data});

  PatientFileModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
  }
}

class Data {
  PatientInfo? patientInfo;
  String? dep;
  String? lastDepartment;
  Other? other;

  Data({this.patientInfo, this.dep, this.lastDepartment, this.other});

  Data.fromJson(Map<String, dynamic> json) {
    patientInfo = json['patient_info'] != null
        ? PatientInfo.fromJson(json['patient_info'])
        : null;
    dep = json['dep'];
    lastDepartment = json['last_department'];
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }
}

class PatientInfo {
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

  PatientInfo(
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

  PatientInfo.fromJson(Map<String, dynamic> json) {
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

class Other {
  int? id;
  int? departmentId;
  int? patientId;
  String? testResult;
  String? xRayResult;
  String? resident;
  String? createdAt;
  String? updatedAt;

  Other(
      {this.id,
        this.departmentId,
        this.patientId,
        this.testResult,
        this.xRayResult,
        this.resident,
        this.createdAt,
        this.updatedAt});

  Other.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['department_id'];
    patientId = json['patient_id'];
    testResult = json['test_result'];
    xRayResult = json['X_ray_result'];
    resident = json['resident'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}