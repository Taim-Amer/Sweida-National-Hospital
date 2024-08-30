class AllPatientInDepartmentModel {
  List<Null>? allPatientThisDepartment;

  AllPatientInDepartmentModel({this.allPatientThisDepartment});

  // AllPatientInDepartmentModel.fromJson(Map<String, dynamic> json) {
  //   if (json['All Patient this Department '] != null) {
  //     allPatientThisDepartment = <Null>[];
  //     json['All Patient this Department '].forEach((v) {
  //       allPatientThisDepartment!.add(new Null.fromJson(v));
  //     });
  //   }
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.allPatientThisDepartment != null) {
  //     data['All Patient this Department '] =
  //         this.allPatientThisDepartment!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}